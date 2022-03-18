;; This file is used for testing import signatures.

(module
    (import "lunatic::error" "string_size" (func (param i64) (result i32)))
    (import "lunatic::error" "to_string" (func (param i64 i32)))
    (import "lunatic::error" "drop" (func (param i64)))

    (import "lunatic::message" "create_data" (func (param i64 i64)))
    (import "lunatic::message" "write_data" (func (param i32 i32) (result i32)))
    (import "lunatic::message" "read_data" (func (param i32 i32) (result i32)))
    (import "lunatic::message" "seek_data" (func (param i64)))
    (import "lunatic::message" "get_tag" (func (result i64)))
    (import "lunatic::message" "data_size" (func (result i64)))
    (import "lunatic::message" "push_process" (func (param i64) (result i64)))
    (import "lunatic::message" "take_process" (func (param i64) (result i64)))
    (import "lunatic::message" "push_tcp_stream" (func (param i64) (result i64)))
    (import "lunatic::message" "take_tcp_stream" (func (param i64) (result i64)))
    (import "lunatic::message" "push_udp_socket" (func (param i64) (result i64)))
    (import "lunatic::message" "take_udp_socket" (func (param i64) (result i64)))
    (import "lunatic::message" "send" (func (param i64)))
    (import "lunatic::message" "send_receive_skip_search" (func (param i64 i32) (result i32)))
    (import "lunatic::message" "receive" (func (param i32 i32 i32) (result i32)))

    (import "lunatic::networking" "resolve" (func (param i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "drop_dns_iterator" (func (param i64)))
    (import "lunatic::networking" "resolve_next" (func (param i64 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "tcp_bind" (func (param i32 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "drop_tcp_listener" (func (param i64)))
    (import "lunatic::networking" "tcp_local_addr" (func (param i64 i32) (result i32)))
    (import "lunatic::networking" "tcp_accept" (func (param i64 i32 i32) (result i32)))
    (import "lunatic::networking" "tcp_connect" (func (param i32 i32 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "drop_tcp_stream" (func (param i64)))
    (import "lunatic::networking" "clone_tcp_stream" (func (param i64) (result i64)))
    (import "lunatic::networking" "tcp_write_vectored" (func (param i64 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "tcp_read" (func (param i64 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "tcp_flush" (func (param i64 i32) (result i32)))
    (import "lunatic::networking" "udp_bind" (func (param i32 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "drop_udp_socket" (func (param i64)))
    (import "lunatic::networking" "udp_local_addr" (func (param i64 i32) (result i32)))
    (import "lunatic::networking" "udp_receive" (func (param i64 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "udp_receive_from" (func (param i64 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "udp_connect" (func (param i64 i32 i32 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "clone_udp_socket" (func (param i64) (result i64)))
    (import "lunatic::networking" "set_udp_socket_broadcast" (func (param i64 i32)))
    (import "lunatic::networking" "get_udp_socket_broadcast" (func (param i64) (result i32)))
    (import "lunatic::networking" "set_udp_socket_ttl" (func (param i64 i32)))
    (import "lunatic::networking" "get_udp_socket_ttl" (func (param i64) (result i32)))
    (import "lunatic::networking" "udp_send_to" (func (param i64 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::networking" "udp_send" (func (param i64 i32 i32 i32 i32) (result i32)))

    (import "lunatic::process" "compile_module" (func (param i32 i32 i32) (result i32)))
    (import "lunatic::process" "drop_module" (func (param i64)))
    (import "lunatic::process" "create_config" (func (result i64)))
    (import "lunatic::process" "drop_config" (func (param i64)))
    (import "lunatic::process" "config_set_max_memory" (func (param i64 i64)))
    (import "lunatic::process" "config_get_max_memory" (func (param i64) (result i64)))
    (import "lunatic::process" "config_set_max_fuel" (func (param i64 i64)))
    (import "lunatic::process" "config_get_max_fuel" (func (param i64) (result i64)))
    (import "lunatic::process" "config_can_compile_modules" (func (param i64) (result i32)))
    (import "lunatic::process" "config_set_can_compile_modules" (func (param i64 i32)))
    (import "lunatic::process" "config_can_create_configs" (func (param i64) (result i32)))
    (import "lunatic::process" "config_set_can_create_configs" (func (param i64 i32)))
    (import "lunatic::process" "config_can_spawn_processes" (func (param i64) (result i32)))
    (import "lunatic::process" "config_set_can_spawn_processes" (func (param i64 i32)))
    (import "lunatic::process" "spawn" (func (param i64 i64 i64 i32 i32 i32 i32 i32) (result i32)))
    (import "lunatic::process" "drop_process" (func (param i64)))
    (import "lunatic::process" "clone_process" (func (param i64) (result i64)))
    (import "lunatic::process" "sleep_ms" (func (param i64)))
    (import "lunatic::process" "die_when_link_dies" (func (param i32)))
    (import "lunatic::process" "this" (func (result i64)))
    (import "lunatic::process" "id" (func (param i64 i32)))
    (import "lunatic::process" "link" (func (param i64 i64)))
    (import "lunatic::process" "unlink" (func (param i64)))

    (import "lunatic::version" "major" (func (result i32)))
    (import "lunatic::version" "minor" (func (result i32)))
    (import "lunatic::version" "patch" (func (result i32)))

    (import "lunatic::wasi" "config_add_environment_variable" (func (param i64 i32 i32 i32 i32)))
    (import "lunatic::wasi" "config_add_command_line_argument" (func (param i64 i32 i32)))
    (import "lunatic::wasi" "config_preopen_dir" (func (param i64 i32 i32)))

    (func (export "hello") nop)
)
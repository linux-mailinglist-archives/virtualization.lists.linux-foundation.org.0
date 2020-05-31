Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9201E94C9
	for <lists.virtualization@lfdr.de>; Sun, 31 May 2020 02:44:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 19D4987733;
	Sun, 31 May 2020 00:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sn8pqAsRjOIZ; Sun, 31 May 2020 00:44:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5359E8773A;
	Sun, 31 May 2020 00:44:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33728C016F;
	Sun, 31 May 2020 00:44:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D560C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 00:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43C0287733
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 00:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hLhZv2mulFm
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 00:44:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 79C1D876C4
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 00:44:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 663AC128DA313;
 Sat, 30 May 2020 17:44:46 -0700 (PDT)
Date: Sat, 30 May 2020 17:44:45 -0700 (PDT)
Message-Id: <20200530.174445.526346281814829960.davem@davemloft.net>
To: justin.he@arm.com
Subject: Re: [PATCH v3] virtio_vsock: Fix race condition in
 virtio_transport_recv_pkt
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200530013828.59668-1-justin.he@arm.com>
References: <20200530013828.59668-1-justin.he@arm.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 30 May 2020 17:44:47 -0700 (PDT)
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Kaly.Xin@arm.com, stefanha@redhat.com, kuba@kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

From: Jia He <justin.he@arm.com>
Date: Sat, 30 May 2020 09:38:28 +0800

> When client on the host tries to connect(SOCK_STREAM, O_NONBLOCK) to the
> server on the guest, there will be a panic on a ThunderX2 (armv8a server):
 ...
> The race condition is as follows:
> Task1                                Task2
> =====                                =====
> __sock_release                       virtio_transport_recv_pkt
>   __vsock_release                      vsock_find_bound_socket (found sk)
>     lock_sock_nested
>     vsock_remove_sock
>     sock_orphan
>       sk_set_socket(sk, NULL)
>     sk->sk_shutdown = SHUTDOWN_MASK
>     ...
>     release_sock
>                                     lock_sock
>                                        virtio_transport_recv_connecting
>                                          sk->sk_socket->state (panic!)
> 
> The root cause is that vsock_find_bound_socket can't hold the lock_sock,
> so there is a small race window between vsock_find_bound_socket() and
> lock_sock(). If __vsock_release() is running in another task,
> sk->sk_socket will be set to NULL inadvertently.
> 
> This fixes it by checking sk->sk_shutdown(suggested by Stefano) after
> lock_sock since sk->sk_shutdown is set to SHUTDOWN_MASK under the
> protection of lock_sock_nested.
> 
> Signed-off-by: Jia He <justin.he@arm.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Applied and queued up for -stable, thank you.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

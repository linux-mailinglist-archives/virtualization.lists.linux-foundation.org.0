Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1FA16FCC8
	for <lists.virtualization@lfdr.de>; Wed, 26 Feb 2020 11:58:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BD2198790F;
	Wed, 26 Feb 2020 10:58:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h5BfqPYSSSSQ; Wed, 26 Feb 2020 10:58:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1568C878F1;
	Wed, 26 Feb 2020 10:58:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D395CC0177;
	Wed, 26 Feb 2020 10:58:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54781C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 10:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4344E86287
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 10:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPdZdHvgXpRs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 10:58:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 099208626C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 10:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582714704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ao4shkARYBOlBvwWDPYByOMa60o0c7ck0bB41Z0If+w=;
 b=Eqdscf1wpzIf21AUYiog6JWFqbC6Wl+5t2nNHIJ63l1VFPLf5+nlfO//rK+Oz3GkPYMPHu
 Pm0SRqeGCm+y2TFP2Lm2STV+fidzivwv2ZcyFNYAhPjJAd/W2XJ75VelrqfIC//9QiOTw9
 nrCtGh9brkXEuti7HxLHmT1Ko3F4Z7Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-OZ5gIOZBNAK0P2kqsEcmlQ-1; Wed, 26 Feb 2020 05:58:22 -0500
X-MC-Unique: OZ5gIOZBNAK0P2kqsEcmlQ-1
Received: by mail-wm1-f71.google.com with SMTP id o24so568627wmh.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 02:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ao4shkARYBOlBvwWDPYByOMa60o0c7ck0bB41Z0If+w=;
 b=bkb/fsO5varaoog4Qd8QdpklMpQWkqvpU2qEME5TiUs5RiuJaqi1xqQlRr84g4pvxt
 sW9p2LNTCLO3dPkMltr8ZeSabyZXBHUBhfY16s4YYlAuvBCU4It0WofpQjWkph0J9F/c
 xLK8xjyQ0zo3OklR35en6qMvcrNGBEs67E15gXeh2RA70zLQksJ27JTuOSdUnXVKsb1q
 jjZnlpN/kMXQ3akMHwEaGYHdYaVIQ1JDTb7t/kPzpxB0Qppp+qnMkjiVqdAwn4MyWEL/
 aYXRMCVI9Zebm33rej0cIiBnfKTJJhcmPE2zzVmQA4s7iYbgPhVK3N7vokTTbIyeFmfk
 sQcg==
X-Gm-Message-State: APjAAAW4i37E55s4bteUyTPstrHsFzDIyZZOPyGN0MhMP6LDoqzY12Ge
 xVEGt57u60xBU3GsGhXiV9rEwSotsx8JB1h1o5Ptbvo56spqQV4yNrpjAC6mFCrs73R9lsrackw
 9SPUZwTjMjqLnNn6tEeK9iodMj7WbHSvOQcwe2HEdMg==
X-Received: by 2002:a5d:526c:: with SMTP id l12mr5137371wrc.117.1582714700514; 
 Wed, 26 Feb 2020 02:58:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyh+hNuja55nNfaQjP9nDbwKYYMHtCqsv8lSLIfOPeY/HkJFiCny/r2KQbRfkc32TKRz7Lunw==
X-Received: by 2002:a5d:526c:: with SMTP id l12mr5137321wrc.117.1582714700113; 
 Wed, 26 Feb 2020 02:58:20 -0800 (PST)
Received: from steredhat.redhat.com
 (host209-4-dynamic.27-79-r.retail.telecomitalia.it. [79.27.4.209])
 by smtp.gmail.com with ESMTPSA id l132sm2619123wmf.16.2020.02.26.02.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 02:58:19 -0800 (PST)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net] vsock: fix potential deadlock in transport->release()
Date: Wed, 26 Feb 2020 11:58:18 +0100
Message-Id: <20200226105818.36055-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Hillf Danton <hdanton@sina.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com, kvm@vger.kernel.org,
 netdev@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Jorgen Hansen <jhansen@vmware.com>
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

Some transports (hyperv, virtio) acquire the sock lock during the
.release() callback.

In the vsock_stream_connect() we call vsock_assign_transport(); if
the socket was previously assigned to another transport, the
vsk->transport->release() is called, but the sock lock is already
held in the vsock_stream_connect(), causing a deadlock reported by
syzbot:

    INFO: task syz-executor280:9768 blocked for more than 143 seconds.
      Not tainted 5.6.0-rc1-syzkaller #0
    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
    syz-executor280 D27912  9768   9766 0x00000000
    Call Trace:
     context_switch kernel/sched/core.c:3386 [inline]
     __schedule+0x934/0x1f90 kernel/sched/core.c:4082
     schedule+0xdc/0x2b0 kernel/sched/core.c:4156
     __lock_sock+0x165/0x290 net/core/sock.c:2413
     lock_sock_nested+0xfe/0x120 net/core/sock.c:2938
     virtio_transport_release+0xc4/0xd60 net/vmw_vsock/virtio_transport_common.c:832
     vsock_assign_transport+0xf3/0x3b0 net/vmw_vsock/af_vsock.c:454
     vsock_stream_connect+0x2b3/0xc70 net/vmw_vsock/af_vsock.c:1288
     __sys_connect_file+0x161/0x1c0 net/socket.c:1857
     __sys_connect+0x174/0x1b0 net/socket.c:1874
     __do_sys_connect net/socket.c:1885 [inline]
     __se_sys_connect net/socket.c:1882 [inline]
     __x64_sys_connect+0x73/0xb0 net/socket.c:1882
     do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
     entry_SYSCALL_64_after_hwframe+0x49/0xbe

To avoid this issue, this patch remove the lock acquiring in the
.release() callback of hyperv and virtio transports, and it holds
the lock when we call vsk->transport->release() in the vsock core.

Reported-by: syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com
Fixes: 408624af4c89 ("vsock: use local transport when it is loaded")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c                | 20 ++++++++++++--------
 net/vmw_vsock/hyperv_transport.c        |  3 ---
 net/vmw_vsock/virtio_transport_common.c |  2 --
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 9c5b2a91baad..a5f28708e0e7 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -451,6 +451,12 @@ int vsock_assign_transport(struct vsock_sock *vsk, struct vsock_sock *psk)
 		if (vsk->transport == new_transport)
 			return 0;
 
+		/* transport->release() must be called with sock lock acquired.
+		 * This path can only be taken during vsock_stream_connect(),
+		 * where we have already held the sock lock.
+		 * In the other cases, this function is called on a new socket
+		 * which is not assigned to any transport.
+		 */
 		vsk->transport->release(vsk);
 		vsock_deassign_transport(vsk);
 	}
@@ -753,20 +759,18 @@ static void __vsock_release(struct sock *sk, int level)
 		vsk = vsock_sk(sk);
 		pending = NULL;	/* Compiler warning. */
 
-		/* The release call is supposed to use lock_sock_nested()
-		 * rather than lock_sock(), if a sock lock should be acquired.
-		 */
-		if (vsk->transport)
-			vsk->transport->release(vsk);
-		else if (sk->sk_type == SOCK_STREAM)
-			vsock_remove_sock(vsk);
-
 		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
 		 * version to avoid the warning "possible recursive locking
 		 * detected". When "level" is 0, lock_sock_nested(sk, level)
 		 * is the same as lock_sock(sk).
 		 */
 		lock_sock_nested(sk, level);
+
+		if (vsk->transport)
+			vsk->transport->release(vsk);
+		else if (sk->sk_type == SOCK_STREAM)
+			vsock_remove_sock(vsk);
+
 		sock_orphan(sk);
 		sk->sk_shutdown = SHUTDOWN_MASK;
 
diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
index 3492c021925f..630b851f8150 100644
--- a/net/vmw_vsock/hyperv_transport.c
+++ b/net/vmw_vsock/hyperv_transport.c
@@ -526,12 +526,9 @@ static bool hvs_close_lock_held(struct vsock_sock *vsk)
 
 static void hvs_release(struct vsock_sock *vsk)
 {
-	struct sock *sk = sk_vsock(vsk);
 	bool remove_sock;
 
-	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
 	remove_sock = hvs_close_lock_held(vsk);
-	release_sock(sk);
 	if (remove_sock)
 		vsock_remove_sock(vsk);
 }
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index d9f0c9c5425a..f3c4bab2f737 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -829,7 +829,6 @@ void virtio_transport_release(struct vsock_sock *vsk)
 	struct sock *sk = &vsk->sk;
 	bool remove_sock = true;
 
-	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
 	if (sk->sk_type == SOCK_STREAM)
 		remove_sock = virtio_transport_close(vsk);
 
@@ -837,7 +836,6 @@ void virtio_transport_release(struct vsock_sock *vsk)
 		list_del(&pkt->list);
 		virtio_transport_free_pkt(pkt);
 	}
-	release_sock(sk);
 
 	if (remove_sock)
 		vsock_remove_sock(vsk);
-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

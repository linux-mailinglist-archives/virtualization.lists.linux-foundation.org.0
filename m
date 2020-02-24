Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2EF16A7B5
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 14:54:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3871785CD0;
	Mon, 24 Feb 2020 13:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdQ4CwUncf+E; Mon, 24 Feb 2020 13:54:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B045585D21;
	Mon, 24 Feb 2020 13:54:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85D7EC0177;
	Mon, 24 Feb 2020 13:54:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44F1DC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3C0A085D21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-Q-K9bh6MQK
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:54:20 +0000 (UTC)
X-Greylist: delayed 00:09:35 by SQLgrey-1.7.6
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by whitealder.osuosl.org (Postfix) with SMTP id 9168385CD0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:54:19 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.0.152])
 by sina.com with ESMTP
 id 5E53D3460002CDCF; Mon, 24 Feb 2020 21:44:40 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 129247628892
From: Hillf Danton <hdanton@sina.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: INFO: task hung in lock_sock_nested (2)
Date: Mon, 24 Feb 2020 21:44:28 +0800
Message-Id: <20200224134428.12256-1-hdanton@sina.com>
In-Reply-To: <20200223075025.9068-1-hdanton@sina.com>
References: <0000000000004241ff059f2eb8a4@google.com>
 <20200223075025.9068-1-hdanton@sina.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org,
 syzbot <syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com>,
 netdev@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 syzkaller-bugs@googlegroups.com, Stefan Hajnoczi <stefanha@redhat.com>,
 kuba@kernel.org, davem@davemloft.net, Jorgen Hansen <jhansen@vmware.com>
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


On Mon, 24 Feb 2020 11:08:53 +0100 Stefano Garzarella wrote:
> On Sun, Feb 23, 2020 at 03:50:25PM +0800, Hillf Danton wrote:
> > 
> > Seems like vsock needs a word to track lock owner in an attempt to
> > avoid trying to lock sock while the current is the lock owner.
> 
> Thanks for this possible solution.
> What about using sock_owned_by_user()?
> 
No chance for vsock_locked() if it works.

> We should fix also hyperv_transport, because it could suffer from the same
> problem.
> 
You're right. My diff is at most for introducing vsk's lock owner.

> At this point, it might be better to call vsk->transport->release(vsk)
> always with the lock taken and remove it in the transports as in the
> following patch.
> 
> What do you think?
> 
Yes and ... please take a look at the output of grep

	grep -n lock_sock linux/net/vmw_vsock/af_vsock.c

as it drove me mad.

> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index 9c5b2a91baad..a073d8efca33 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -753,20 +753,18 @@ static void __vsock_release(struct sock *sk, int level)
>  		vsk = vsock_sk(sk);
>  		pending = NULL;	/* Compiler warning. */
>  
> -		/* The release call is supposed to use lock_sock_nested()
> -		 * rather than lock_sock(), if a sock lock should be acquired.
> -		 */
> -		if (vsk->transport)
> -			vsk->transport->release(vsk);
> -		else if (sk->sk_type == SOCK_STREAM)
> -			vsock_remove_sock(vsk);
> -
>  		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
>  		 * version to avoid the warning "possible recursive locking
>  		 * detected". When "level" is 0, lock_sock_nested(sk, level)
>  		 * is the same as lock_sock(sk).
>  		 */
>  		lock_sock_nested(sk, level);
> +
> +		if (vsk->transport)
> +			vsk->transport->release(vsk);
> +		else if (sk->sk_type == SOCK_STREAM)
> +			vsock_remove_sock(vsk);
> +
>  		sock_orphan(sk);
>  		sk->sk_shutdown = SHUTDOWN_MASK;
>  
> diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
> index 3492c021925f..510f25f4a856 100644
> --- a/net/vmw_vsock/hyperv_transport.c
> +++ b/net/vmw_vsock/hyperv_transport.c
> @@ -529,9 +529,7 @@ static void hvs_release(struct vsock_sock *vsk)
>  	struct sock *sk = sk_vsock(vsk);
>  	bool remove_sock;
>  
> -	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
>  	remove_sock = hvs_close_lock_held(vsk);
> -	release_sock(sk);
>  	if (remove_sock)
>  		vsock_remove_sock(vsk);
>  }
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index d9f0c9c5425a..f3c4bab2f737 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -829,7 +829,6 @@ void virtio_transport_release(struct vsock_sock *vsk)
>  	struct sock *sk = &vsk->sk;
>  	bool remove_sock = true;
>  
> -	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
>  	if (sk->sk_type == SOCK_STREAM)
>  		remove_sock = virtio_transport_close(vsk);
>  
> @@ -837,7 +836,6 @@ void virtio_transport_release(struct vsock_sock *vsk)
>  		list_del(&pkt->list);
>  		virtio_transport_free_pkt(pkt);
>  	}
> -	release_sock(sk);
>  
>  	if (remove_sock)
>  		vsock_remove_sock(vsk);
> 
> Thanks,
> Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

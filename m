Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D47FC2DDF
	for <lists.virtualization@lfdr.de>; Tue,  1 Oct 2019 09:28:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0AA057C55;
	Tue,  1 Oct 2019 07:28:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CCF6B7BBE
	for <virtualization@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 07:28:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2E9313D0
	for <virtualization@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 07:28:37 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 447CE4ACA7
	for <virtualization@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 07:28:36 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id w10so5603324wrl.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 01 Oct 2019 00:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rGxRLfEJC1VYNtKSX6kyfg0tMas1+rSvzHhUE5eK6q4=;
	b=T7oiERhm6lpBO+nddVfZ8ooUWDHu5ruamesS7b12rLXKOCtf81aNjEgqM0Kv2BmKvR
	eu7fScs8MIqI94znawvY3UEiAfGxv9SY4umhkbI+MC02xM3Y7wXUtEKxD0RtkDi62V9f
	fhqs5QKUSate6pR0HXv4utlqkkmpQfQkGqapyVXzDlCaQiOBynFwj3W8Az6iX4GvM+On
	GMjqpqZFmfxtlE4y4a8A6NW0REHJKiOSKJLDfx3OJT7PIS1lau1LFSdCsWigioF3hqv8
	aR0MlkhEek55EJcyjl4WuuDYkgEaKEaE5sB4maQlnSmsCq6Xhxih/U5xAqfzfwHYJXWq
	Qi6w==
X-Gm-Message-State: APjAAAW8moXWkpgSyZNGdoQ/cPLMMkVqbk4st+DWGSWysMwoKKAb9jEU
	V2EvYN32lYD7mnM9ymCJ/M6rg96GRujSNhEPzapsKJOmji7rpB1lQe+GxAi2mufr7bPv5kIEB8/
	quDG64Wva8b/FT0IBx3wwSmIyoY6KFYPLR8hY/8adgw==
X-Received: by 2002:a5d:5231:: with SMTP id i17mr16517830wra.142.1569914914942;
	Tue, 01 Oct 2019 00:28:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzfP3jzsJGYljEi7cfS5kj/VjiNXOMN2jPKXfvjeLCGNRNerLEOfzcw+u+tiV4YVMMyE9GAQ==
X-Received: by 2002:a5d:5231:: with SMTP id i17mr16517808wra.142.1569914914666;
	Tue, 01 Oct 2019 00:28:34 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	a71sm1892939wme.11.2019.10.01.00.28.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 01 Oct 2019 00:28:34 -0700 (PDT)
Date: Tue, 1 Oct 2019 09:28:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH net v3] vsock: Fix a lockdep warning in __vsock_release()
Message-ID: <20191001072831.msry462b7l32fhsw@steredhat.homenet.telecomitalia.it>
References: <1569868998-56603-1-git-send-email-decui@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569868998-56603-1-git-send-email-decui@microsoft.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "sashal@kernel.org" <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ytht.net@gmail.com" <ytht.net@gmail.com>,
	"deepa.kernel@gmail.com" <deepa.kernel@gmail.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"jhansen@vmware.com" <jhansen@vmware.com>,
	Michael Kelley <mikelley@microsoft.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Sep 30, 2019 at 06:43:50PM +0000, Dexuan Cui wrote:
> Lockdep is unhappy if two locks from the same class are held.
> 
> Fix the below warning for hyperv and virtio sockets (vmci socket code
> doesn't have the issue) by using lock_sock_nested() when __vsock_release()
> is called recursively:
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.3.0+ #1 Not tainted
> --------------------------------------------
> server/1795 is trying to acquire lock:
> ffff8880c5158990 (sk_lock-AF_VSOCK){+.+.}, at: hvs_release+0x10/0x120 [hv_sock]
> 
> but task is already holding lock:
> ffff8880c5158150 (sk_lock-AF_VSOCK){+.+.}, at: __vsock_release+0x2e/0xf0 [vsock]
> 
> other info that might help us debug this:
>  Possible unsafe locking scenario:
> 
>        CPU0
>        ----
>   lock(sk_lock-AF_VSOCK);
>   lock(sk_lock-AF_VSOCK);
> 
>  *** DEADLOCK ***
> 
>  May be due to missing lock nesting notation
> 
> 2 locks held by server/1795:
>  #0: ffff8880c5d05ff8 (&sb->s_type->i_mutex_key#10){+.+.}, at: __sock_release+0x2d/0xa0
>  #1: ffff8880c5158150 (sk_lock-AF_VSOCK){+.+.}, at: __vsock_release+0x2e/0xf0 [vsock]
> 
> stack backtrace:
> CPU: 5 PID: 1795 Comm: server Not tainted 5.3.0+ #1
> Call Trace:
>  dump_stack+0x67/0x90
>  __lock_acquire.cold.67+0xd2/0x20b
>  lock_acquire+0xb5/0x1c0
>  lock_sock_nested+0x6d/0x90
>  hvs_release+0x10/0x120 [hv_sock]
>  __vsock_release+0x24/0xf0 [vsock]
>  __vsock_release+0xa0/0xf0 [vsock]
>  vsock_release+0x12/0x30 [vsock]
>  __sock_release+0x37/0xa0
>  sock_close+0x14/0x20
>  __fput+0xc1/0x250
>  task_work_run+0x98/0xc0
>  do_exit+0x344/0xc60
>  do_group_exit+0x47/0xb0
>  get_signal+0x15c/0xc50
>  do_signal+0x30/0x720
>  exit_to_usermode_loop+0x50/0xa0
>  do_syscall_64+0x24e/0x270
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x7f4184e85f31
> 
> Tested-by: Stefano Garzarella <sgarzare@redhat.com>
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> ---

The patch LGTM and and functionally it's the same as the v2 that I tested, so:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

> 
> Changes in v2:
>   Avoid the duplication of code in v1.
>   Also fix virtio socket code.
> 
> 
> Changes in v3:
>   Use "lock_sock_nested(sk, level);" -- suggested by Stefano.
>   Add Stefano's Tested-by.
> 
>  net/vmw_vsock/af_vsock.c                | 16 ++++++++++++----
>  net/vmw_vsock/hyperv_transport.c        |  2 +-
>  net/vmw_vsock/virtio_transport_common.c |  2 +-
>  3 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
> index ab47bf3ab66e..2ab43b2bba31 100644
> --- a/net/vmw_vsock/af_vsock.c
> +++ b/net/vmw_vsock/af_vsock.c
> @@ -638,7 +638,7 @@ struct sock *__vsock_create(struct net *net,
>  }
>  EXPORT_SYMBOL_GPL(__vsock_create);
>  
> -static void __vsock_release(struct sock *sk)
> +static void __vsock_release(struct sock *sk, int level)
>  {
>  	if (sk) {
>  		struct sk_buff *skb;
> @@ -648,9 +648,17 @@ static void __vsock_release(struct sock *sk)
>  		vsk = vsock_sk(sk);
>  		pending = NULL;	/* Compiler warning. */
>  
> +		/* The release call is supposed to use lock_sock_nested()
> +		 * rather than lock_sock(), if a sock lock should be acquired.
> +		 */
>  		transport->release(vsk);
>  
> -		lock_sock(sk);
> +		/* When "level" is SINGLE_DEPTH_NESTING, use the nested
> +		 * version to avoid the warning "possible recursive locking
> +		 * detected". When "level" is 0, lock_sock_nested(sk, level)
> +		 * is the same as lock_sock(sk).
> +		 */
> +		lock_sock_nested(sk, level);
>  		sock_orphan(sk);
>  		sk->sk_shutdown = SHUTDOWN_MASK;
>  
> @@ -659,7 +667,7 @@ static void __vsock_release(struct sock *sk)
>  
>  		/* Clean up any sockets that never were accepted. */
>  		while ((pending = vsock_dequeue_accept(sk)) != NULL) {
> -			__vsock_release(pending);
> +			__vsock_release(pending, SINGLE_DEPTH_NESTING);
>  			sock_put(pending);
>  		}
>  
> @@ -708,7 +716,7 @@ EXPORT_SYMBOL_GPL(vsock_stream_has_space);
>  
>  static int vsock_release(struct socket *sock)
>  {
> -	__vsock_release(sock->sk);
> +	__vsock_release(sock->sk, 0);
>  	sock->sk = NULL;
>  	sock->state = SS_FREE;
>  
> diff --git a/net/vmw_vsock/hyperv_transport.c b/net/vmw_vsock/hyperv_transport.c
> index 261521d286d6..c443db7af8d4 100644
> --- a/net/vmw_vsock/hyperv_transport.c
> +++ b/net/vmw_vsock/hyperv_transport.c
> @@ -559,7 +559,7 @@ static void hvs_release(struct vsock_sock *vsk)
>  	struct sock *sk = sk_vsock(vsk);
>  	bool remove_sock;
>  
> -	lock_sock(sk);
> +	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
>  	remove_sock = hvs_close_lock_held(vsk);
>  	release_sock(sk);
>  	if (remove_sock)
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 5bb70c692b1e..a666ef8fc54e 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -820,7 +820,7 @@ void virtio_transport_release(struct vsock_sock *vsk)
>  	struct sock *sk = &vsk->sk;
>  	bool remove_sock = true;
>  
> -	lock_sock(sk);
> +	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
>  	if (sk->sk_type == SOCK_STREAM)
>  		remove_sock = virtio_transport_close(vsk);
>  
> -- 
> 2.19.1
> 

-- 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

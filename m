Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8271E83C8
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 18:34:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C66486C52;
	Fri, 29 May 2020 16:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1HiS90DESn1; Fri, 29 May 2020 16:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E44D2874E8;
	Fri, 29 May 2020 16:34:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCF04C016F;
	Fri, 29 May 2020 16:34:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6E2BC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 16:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A55F9874E8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 16:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MA6PxIH_NqGr
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 16:34:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9A73186C52
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 16:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590770059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dZ3Au5FaNGsFuALhZak+xDg1jZacBxkv5pzIdzHUfKU=;
 b=MAZPTIqdjBx4qOWxqDv23mK3HIx51kGXPrn5QLyM/s265yb/PFKzYB0egx9+kXia1+UDQ0
 lIRrCAbJIxoCEaFfExHKslnO2aX6awMu5X8n7a691cGynI/gRbA77cmHgtSuqNnxTm3iL9
 E2Uip4Br2SMtUCnMELP4q4h0fUob0aE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-8EAekYx-P1OPQl3d89IFJg-1; Fri, 29 May 2020 12:34:17 -0400
X-MC-Unique: 8EAekYx-P1OPQl3d89IFJg-1
Received: by mail-wr1-f70.google.com with SMTP id s17so1252154wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 09:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dZ3Au5FaNGsFuALhZak+xDg1jZacBxkv5pzIdzHUfKU=;
 b=Gqx+qBkFRy540frIikdB4fzJH1ret9DC4ISiH94LKGEQIKDdXKw2wfgnX0Sc3i4mfF
 cFNOm5NRyEBvusHnBOzgv4+ccJC3zTtOjxJNRA+4o2dk+1syX1QUUR/EMSUBo3N7QFBQ
 kM74kIWF971agDQ9wg8DT5bwdXioMSxcxttv+w1UvBpnP84wtUhC+MfpuePIVfxccy2P
 R07X1GuEEP50j9mxsTpTkRyWqVemCjxTV7Cstp/YXyNOsZJ8Z7D2EWPvc21Xj/NUoLkl
 zSMpYtzn1NHu3mkaEW5lI/nxVhnR8n3wtGjkl0687Kgnh92ajaoQdEffq6R+/16wIt9N
 xdrA==
X-Gm-Message-State: AOAM5313NICyhLi/HvX8kQdjlo6h/FTzeILFSyZ7lJ+7heaLOYxgby/h
 qQHxila9Is4ltADSwPEPBQrm1hi/EnSLrVso6uysnGjmXlK0TQb2JjT+fN4fts0feRRXJenuDXv
 uoRZlmHBq/WKq9bcRqmqBLfgPivkOzvbpEeiXuN1UgQ==
X-Received: by 2002:adf:dbc1:: with SMTP id e1mr2275424wrj.339.1590770055854; 
 Fri, 29 May 2020 09:34:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ889WcL2gc5cE15AzE4PQixcL+wfygpza9dr3frPSqYQSWVW6QADK+d89yCcehEvnie2qnA==
X-Received: by 2002:adf:dbc1:: with SMTP id e1mr2275400wrj.339.1590770055587; 
 Fri, 29 May 2020 09:34:15 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id r6sm323841wmh.1.2020.05.29.09.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 09:34:15 -0700 (PDT)
Date: Fri, 29 May 2020 18:34:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia He <justin.he@arm.com>
Subject: Re: [PATCH v2] virtio_vsock: Fix race condition in
 virtio_transport_recv_pkt
Message-ID: <20200529163412.fqswshs65f53qgez@steredhat>
References: <20200529152102.58397-1-justin.he@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200529152102.58397-1-justin.he@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Kaly Xin <Kaly.Xin@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Fri, May 29, 2020 at 11:21:02PM +0800, Jia He wrote:
> When client tries to connect(SOCK_STREAM) the server in the guest with
> NONBLOCK mode, there will be a panic on a ThunderX2 (armv8a server):
> [  463.718844][ T5040] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [  463.718848][ T5040] Mem abort info:
> [  463.718849][ T5040]   ESR = 0x96000044
> [  463.718852][ T5040]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  463.718853][ T5040]   SET = 0, FnV = 0
> [  463.718854][ T5040]   EA = 0, S1PTW = 0
> [  463.718855][ T5040] Data abort info:
> [  463.718856][ T5040]   ISV = 0, ISS = 0x00000044
> [  463.718857][ T5040]   CM = 0, WnR = 1
> [  463.718859][ T5040] user pgtable: 4k pages, 48-bit VAs, pgdp=0000008f6f6e9000
> [  463.718861][ T5040] [0000000000000000] pgd=0000000000000000
> [  463.718866][ T5040] Internal error: Oops: 96000044 [#1] SMP
> [...]
> [  463.718977][ T5040] CPU: 213 PID: 5040 Comm: vhost-5032 Tainted: G           O      5.7.0-rc7+ #139
> [  463.718980][ T5040] Hardware name: GIGABYTE R281-T91-00/MT91-FS1-00, BIOS F06 09/25/2018
> [  463.718982][ T5040] pstate: 60400009 (nZCv daif +PAN -UAO)
> [  463.718995][ T5040] pc : virtio_transport_recv_pkt+0x4c8/0xd40 [vmw_vsock_virtio_transport_common]
> [  463.718999][ T5040] lr : virtio_transport_recv_pkt+0x1fc/0xd40 [vmw_vsock_virtio_transport_common]
> [  463.719000][ T5040] sp : ffff80002dbe3c40
> [...]
> [  463.719025][ T5040] Call trace:
> [  463.719030][ T5040]  virtio_transport_recv_pkt+0x4c8/0xd40 [vmw_vsock_virtio_transport_common]
> [  463.719034][ T5040]  vhost_vsock_handle_tx_kick+0x360/0x408 [vhost_vsock]
> [  463.719041][ T5040]  vhost_worker+0x100/0x1a0 [vhost]
> [  463.719048][ T5040]  kthread+0x128/0x130
> [  463.719052][ T5040]  ret_from_fork+0x10/0x18
         ^         ^
Maybe we can remove these two columns from the commit message.

> 
> The race condition as follows:
> Task1                            Task2
> =====                            =====
> __sock_release                   virtio_transport_recv_pkt
>   __vsock_release                  vsock_find_bound_socket (found)
>     lock_sock_nested
>     vsock_remove_sock
>     sock_orphan
>       sk_set_socket(sk, NULL)

Here we can add:
      sk->sk_shutdown = SHUTDOWN_MASK;

>     ...
>     release_sock
>                                 lock_sock
>                                    virtio_transport_recv_connecting
>                                      sk->sk_socket->state (panic)
> 
> The root cause is that vsock_find_bound_socket can't hold the lock_sock,
> so there is a small race window between vsock_find_bound_socket() and
> lock_sock(). If there is __vsock_release() in another task, sk->sk_socket
> will be set to NULL inadvertently.
> 
> This fixes it by checking sk->sk_shutdown.
> 
> Signed-off-by: Jia He <justin.he@arm.com>
> Cc: stable@vger.kernel.org
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2: use lightweight checking suggested by Stefano Garzarella
> 
>  net/vmw_vsock/virtio_transport_common.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 69efc891885f..0edda1edf988 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -1132,6 +1132,14 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  
>  	lock_sock(sk);
>  
> +	/* Check if sk has been released before lock_sock */
> +	if (sk->sk_shutdown == SHUTDOWN_MASK) {
> +		(void)virtio_transport_reset_no_sock(t, pkt);
> +		release_sock(sk);
> +		sock_put(sk);
> +		goto free_pkt;
> +	}
> +
>  	/* Update CID in case it has changed after a transport reset event */
>  	vsk->local_addr.svm_cid = dst.svm_cid;
>  
> -- 
> 2.17.1
> 

Anyway, the patch LGTM, let see what David and other say.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

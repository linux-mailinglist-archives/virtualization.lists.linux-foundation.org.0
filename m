Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A01E7FC5
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 16:10:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08A5788426;
	Fri, 29 May 2020 14:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7+4muQEY-SR; Fri, 29 May 2020 14:10:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58A0088406;
	Fri, 29 May 2020 14:10:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A374C016F;
	Fri, 29 May 2020 14:10:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ACAEC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 14:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 964922000F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 14:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxaZa0X2wC-z
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 14:10:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F7611FF59
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590761441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TErd239L9m87GMKq1OnfAdElyOZMwB2hfVFAiSe/inE=;
 b=MYB1hTtlWi2MUOt9skQLTS0gURR+b3Ap/+9y3iL4wpdvlb2rr5WupjOo/3GCT+6GFoYoP8
 bkmV+EVheqR1m5+Yhro01nH1YmQVNhn/HVUH/hUtntHrEmjha631K5gHd/INYepwl2GYxe
 BZOLRewg1R1OXnIC7ObzhLB4w1o1OwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-RAdwCNjGM6G36GSkrLrX5g-1; Fri, 29 May 2020 10:10:39 -0400
X-MC-Unique: RAdwCNjGM6G36GSkrLrX5g-1
Received: by mail-wm1-f72.google.com with SMTP id t145so743516wmt.2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 07:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TErd239L9m87GMKq1OnfAdElyOZMwB2hfVFAiSe/inE=;
 b=W3QXcXq/F6dthu2cI/sCQM/iplp1xVQJdCd+8o07lCuJUQrq6K4ldMz1nmoZ6QRWs3
 LVTtt0j1PM6eKGl78VCpZfw468stIKvZicuC1CAsTmDVJUCWihxHQeFBRzwO1x8WtrxX
 wac1fvnRYTJTiqLbvpYFwsA+8m7VrcgFgcFpcxHsC2k7Agf/jJraWBI6Oh6jDTSskH+y
 dNbrt3tIUbND2cpdyAjtfIgD581yfdsgoI+s5VnhCmGDZQTubSSkEUNuZzjgZnYbBPrF
 gIIswJLKwKz66um/VaTikoaeJVthROrPzwBURMg0fgMo91wu4/b2KimZWGPPdKI0iyZg
 eqlA==
X-Gm-Message-State: AOAM531godCnEs4r8vBe10d17NRsN6iW+UrgDs9CrJQqolpOf3/3QIXt
 1RcklYQ3IThrJSFvxmhFai2PLf2U29SofgCwMTW0srBovS2JxwTpqoIlFdhZcwGj2UpNIcTdiKD
 N+NnfE+mAo4TZyXcEiQ/IQRTocC8iBPZxR63W4dyutQ==
X-Received: by 2002:adf:9c84:: with SMTP id d4mr8354237wre.327.1590761437218; 
 Fri, 29 May 2020 07:10:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU77CJCETVAQ/MakEhpXlB82Ntk+mmoh9WlUWbgSUeZEVhUvd9NyaJdmipxrh62Yze6wV5Xg==
X-Received: by 2002:adf:9c84:: with SMTP id d4mr8354212wre.327.1590761436822; 
 Fri, 29 May 2020 07:10:36 -0700 (PDT)
Received: from steredhat ([79.49.207.108])
 by smtp.gmail.com with ESMTPSA id u7sm10292389wrm.23.2020.05.29.07.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 07:10:36 -0700 (PDT)
Date: Fri, 29 May 2020 16:10:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jia He <justin.he@arm.com>
Subject: Re: [PATCH] virtio_vsock: Fix race condition in
 virtio_transport_recv_pkt
Message-ID: <20200529141033.iqtmu3giph6dekuj@steredhat>
References: <20200529133123.195610-1-justin.he@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200529133123.195610-1-justin.he@arm.com>
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

Hi Jia,
thanks for the patch! I have some comments.

On Fri, May 29, 2020 at 09:31:23PM +0800, Jia He wrote:
> When client tries to connect(SOCK_STREAM) the server in the guest with NONBLOCK
> mode, there will be a panic on a ThunderX2 (armv8a server):
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
>     ...
>     release_sock
>                                 lock_sock
>                                    virtio_transport_recv_connecting
>                                      sk->sk_socket->state (panic)
> 
> This fixes it by checking vsk again whether it is in bound/connected table.
> 
> Signed-off-by: Jia He <justin.he@arm.com>
> Cc: stable@vger.kernel.org
> ---
>  net/vmw_vsock/virtio_transport_common.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 69efc891885f..0dbd6a45f0ed 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -1132,6 +1132,17 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  
>  	lock_sock(sk);
>  
> +	/* Check it again if vsk is removed by vsock_remove_sock */
> +	spin_lock_bh(&vsock_table_lock);
> +	if (!__vsock_in_bound_table(vsk) && !__vsock_in_connected_table(vsk)) {
> +		spin_unlock_bh(&vsock_table_lock);
> +		(void)virtio_transport_reset_no_sock(t, pkt);
> +		release_sock(sk);
> +		sock_put(sk);
> +		goto free_pkt;
> +	}
> +	spin_unlock_bh(&vsock_table_lock);
> +

As an a simpler alternative, can we check the sk_shutdown or the socket
state without check again both bound and connected tables?

This is a data path, so we should take it faster.

I mean something like this:

	if (sk->sk_shutdown == SHUTDOWN_MASK) {
		...
	}

or

	if (sock_flag(sk, SOCK_DEAD)) {
		...
	}

I prefer the first option, but I think also the second option should
work.

Thanks,
Stefano

>  	/* Update CID in case it has changed after a transport reset event */
>  	vsk->local_addr.svm_cid = dst.svm_cid;
>  
> -- 
> 2.17.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

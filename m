Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E911B6C7
	for <lists.virtualization@lfdr.de>; Wed, 11 Dec 2019 17:03:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03C47869E1;
	Wed, 11 Dec 2019 16:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uitpd5GUKo6J; Wed, 11 Dec 2019 16:03:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C7BA86940;
	Wed, 11 Dec 2019 16:03:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 782FFC0881;
	Wed, 11 Dec 2019 16:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 664E9C1796
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5F2D686934
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oO_U_-SN_cA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 91BCC85722
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576080196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PrU2b1A7wFnGMPDUwy3vrqDBvmg9UHpem0VgQwkUVY=;
 b=GEvRipgHiL1QOK/04rmPGhvrdrzwxleMvyy9BuWIxZ6Strij/u6G7GEvFcykVloLnI8idb
 OgwJCI/87yoLidgl7wovflPl8trgk6/uXGvLgxyDb1EH41Zb10jqmG72QJ2YrWt4DrVyNV
 CRCqggZdWaKghiB0KrqQOg8NboAxyzg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-pAHwb051PSOsLpUzz0MUDw-1; Wed, 11 Dec 2019 11:03:12 -0500
Received: by mail-qt1-f200.google.com with SMTP id z12so4691643qts.15
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6gfZXNRDfcJ0EDIOFFIp2NIhgwIPnf16ocIK/xP3HK0=;
 b=h8XAE7n4EZMtQ7ame+bUqTuKb2idDYH5oh7CPCmT3iGbMBirsSABKs7+/ZR94JF2Hq
 qKU6XY5UlVkwHfXo0BQ7AGvMd0YUbOIPUhdSUNB8X3NF6UrwLTjxmwp6MI1RnJ8vna1o
 KmuKLUAXG/eani/M13fP79/xQGbMHYCMkY55DbAAzAP6HCJ2tJHJMz5nAhk5HcYQevRR
 VPr+6DiP3/01yhCKSsNWGaNhG892FmKSuoNsMaPLOa6E3P/TRhKlVYN3Da3wMIxSxs7O
 HmN1Vl3zAPtN5rjtDt/+LOm5F6R3rdnu9feE4jo71DKvzsbNPSGFPWQEGRHqA5nwf7wg
 710Q==
X-Gm-Message-State: APjAAAXKChgeocuvZuoGm2cck9BM8DubV3A6ZCwIDWPP2dmhJYVq4PGr
 0bZwzMfqOhip+btBrq4K+oEn7YyatjEGwiDAQg8eFq1K078UxoULQxK8MJlpvTYZVTAk/EV1tXe
 VRVhvlgJ3gPiQKva9blmpKz16IuCv/yADm561ZH6NaA==
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr3515480qka.386.1576080192423; 
 Wed, 11 Dec 2019 08:03:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQQ2Bwv6/Qhu4cPFoF7Ygb0/S4EIjerRyxmrHRlOtQFWaSfcUrQlX7U0QxQDZ6VV+soS6Sdg==
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr3515454qka.386.1576080192203; 
 Wed, 11 Dec 2019 08:03:12 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id q14sm1027460qtp.48.2019.12.11.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 08:03:11 -0800 (PST)
Date: Wed, 11 Dec 2019 11:03:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191211110235-mutt-send-email-mst@kernel.org>
References: <20191206143912.153583-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191206143912.153583-1-sgarzare@redhat.com>
X-MC-Unique: pAHwb051PSOsLpUzz0MUDw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On Fri, Dec 06, 2019 at 03:39:12PM +0100, Stefano Garzarella wrote:
> When we receive a new packet from the guest, we check if the
> src_cid is correct, but we forgot to check the dst_cid.
> 
> The host should accept only packets where dst_cid is
> equal to the host CID.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Stefano can you clarify the impact pls?
E.g. is this needed on stable? Etc.

Thanks!

> ---
>  drivers/vhost/vsock.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 50de0642dea6..c2d7d57e98cf 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -480,7 +480,9 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  		virtio_transport_deliver_tap_pkt(pkt);
>  
>  		/* Only accept correctly addressed packets */
> -		if (le64_to_cpu(pkt->hdr.src_cid) == vsock->guest_cid)
> +		if (le64_to_cpu(pkt->hdr.src_cid) == vsock->guest_cid &&
> +		    le64_to_cpu(pkt->hdr.dst_cid) ==
> +		    vhost_transport_get_local_cid())
>  			virtio_transport_recv_pkt(&vhost_transport, pkt);
>  		else
>  			virtio_transport_free_pkt(pkt);
> -- 
> 2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

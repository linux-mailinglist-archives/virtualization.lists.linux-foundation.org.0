Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C093118A65
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 15:06:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E87E882B5;
	Tue, 10 Dec 2019 14:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OJwWEgCGA60; Tue, 10 Dec 2019 14:06:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 52CAB88324;
	Tue, 10 Dec 2019 14:06:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DF7EC0881;
	Tue, 10 Dec 2019 14:06:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F035C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0E11D86783
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKBnNB1tz6Lo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:06:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4C476868AF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575986764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9cYSQHCTDQkKzmRIgQpyk3DnPt+k/A4ckdhU2f8Or6g=;
 b=aezCjhcsuEiduFAdc2wCO4KzHE3M4abW/uEsH5HsjXtSuy6FEqIWYh3Pf+Es31LRm+pv/q
 YHSbh1oOxAs3iQFQ7P3W6gwoFy94IO6Lp6MT6DLcskqtS82l2juVYq+lq1/xigsCaX1UG8
 18WGMfbaf+xKp/XTw6M9U0KXdNRrLpQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-Hp5bMITLPEGDMNASltepyw-1; Tue, 10 Dec 2019 09:06:03 -0500
Received: by mail-wm1-f72.google.com with SMTP id q21so1037159wmc.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 06:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CI3qbc7xp4DF6AaDOfblCvC5kTkzEe7UO4aRTK6V7jk=;
 b=DeI19IzNT909qUQu7SdWOexVfuQtTzR5LSDVO6Vm5RcHFcwk+8G43MV9jQhs8Y70k0
 KPT8n57rOP1nd3+wM+jyY9U+u7tyZzoIz7VcYw0fo+LupjDHJrfCfPTJLB2Cp1mdTvDJ
 /nhhDxURUscljSI7fSx+10MZQKVQe78qiHs4R4KL6kSmm07Jtj7ufURqGPXf0nC70m58
 EN1o0DjAim7pYsP5z3G+q5Jp1y2GGPoC1z8ouLO5SgHxHnAm+FjNsDEa+mN1PqCWcFR3
 LyB31/GxZFXuFRpgGe44vHgustT9RXBwcRPJhjzGzeaiPY6IA9zZG2YVdxIyBSC0+xAR
 Z4xA==
X-Gm-Message-State: APjAAAXWJcKYgBviqXBqFTGOoCHlq9HMjg4UV4mqp1CHRAQ23CGuTScp
 KpLZuUTUV6GhRZs+6lmnxpezqiBThw0Rn4uyGY1OswC98FlAj54Y2gB4WI1VrB3yqoFzRbgFOBY
 4ndQlviVsZswQ55ZePwXOFlL5oferx0xlbdAa6EpzjQ==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr5415220wmm.70.1575986762103; 
 Tue, 10 Dec 2019 06:06:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzt2DwRGDx/tfuLDX74AYEnOhZaQrk2tBhSVe7oGiWrvR5kBtkcogM60airAVN4tsBt+f/Tiw==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr5415198wmm.70.1575986761941; 
 Tue, 10 Dec 2019 06:06:01 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id a5sm3131833wmb.37.2019.12.10.06.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 06:06:01 -0800 (PST)
Date: Tue, 10 Dec 2019 09:05:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vhost/vsock: accept only packets with the right dst_cid
Message-ID: <20191210090505-mutt-send-email-mst@kernel.org>
References: <20191206143912.153583-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191206143912.153583-1-sgarzare@redhat.com>
X-MC-Unique: Hp5bMITLPEGDMNASltepyw-1
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

what's the implication of processing incorrect dst cid?
I think mostly it's malformed guests, right?
Everyone else just passes the known host cid ...

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

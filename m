Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461119C1A3
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 15:06:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E799586D61;
	Thu,  2 Apr 2020 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JtwaWkWgOn0g; Thu,  2 Apr 2020 13:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81A5386AE2;
	Thu,  2 Apr 2020 13:06:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67A65C07FF;
	Thu,  2 Apr 2020 13:06:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21CC0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0447720453
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GUMQ-2B7gMIF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id B697220450
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585832809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jrC91KuPE6k3Jhp+uJLt4SSvrtT8vBXML157M+Ugy6U=;
 b=BNxcTXwkY/CBZ0N0Jm1TiDz1lj1/WMEMGeC1Ver6rlPjaPPXqNgnimGctmIQKSeR5S9Od8
 KpJ1QOfYSFmRUwboruC2vul2Bxzaj7u0edBg27XmAhqilTK20dOXiHZIakXKifjSUZ/8eJ
 w1gvnoqAq2CTIh56yzBGJlrX1RkfR7s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146--YHygwKZPpureOgpYXW3EQ-1; Thu, 02 Apr 2020 09:06:48 -0400
X-MC-Unique: -YHygwKZPpureOgpYXW3EQ-1
Received: by mail-qv1-f72.google.com with SMTP id h12so2604669qvx.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 06:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jrC91KuPE6k3Jhp+uJLt4SSvrtT8vBXML157M+Ugy6U=;
 b=lE5ZxMmnMfyix4REff3jgkdzHbDIJRgYRw2VpD7q3iDJMbipXwWCCvFM3w9y73drdL
 mIr8Z6wPqKEQj9CoVjN1SGR+ND5TGrTtn3piDhsiz8/Z3P6cMWSXQ2d0OKcDvNfjYoFy
 3NbONuxFQpvnaYY0I91mzdCKQ70dfNYUdkax/ZhkF/N8rIYnHA1M10iSJS7jrSvoLFdu
 5xrIoftlFeVDGRAOtO7qWd0Tf7QDVa3gxlw6mXAyuBjeDSz6nl9qeVu5tpRjznHuQO+m
 vU5PoAZjoGdjqbs0jyh7er+cNMM1R0HmnJEbsVXC52bexIxhXJcSX+2Drn1Xhg/PiV0C
 4gJg==
X-Gm-Message-State: AGi0PuaHavmyHiNu3U6+QlDbtp1QlSLd+m/FlnpR4FXU3dYLXDXWYqhM
 CNE19T21gfkBBGUxIprNU47oN75ekeFTIhqlX2q2WPf3pPNQ9xO6qY4E6amC0sw7KI9e/hA/Txa
 kUHmkuutQ/Woxch0ffcR0L2C2JGSJlgkEVmp+E6ffYw==
X-Received: by 2002:aed:3221:: with SMTP id y30mr2697851qtd.199.1585832806115; 
 Thu, 02 Apr 2020 06:06:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypLglyzvuTR1yyzvDP10Ld4UV7njgo1av3F3+XpjVKRvR2Mjvu+DmlUsk/d6U6D9AcRrLED1zg==
X-Received: by 2002:aed:3221:: with SMTP id y30mr2697623qtd.199.1585832804115; 
 Thu, 02 Apr 2020 06:06:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id o186sm3450365qke.39.2020.04.02.06.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 06:06:43 -0700 (PDT)
Date: Thu, 2 Apr 2020 09:06:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next] virtio-balloon: Make virtballoon_free_page_report
 static
Message-ID: <20200402090550-mutt-send-email-mst@kernel.org>
References: <20200402024302.35192-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200402024302.35192-1-yuehaibing@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Thu, Apr 02, 2020 at 10:43:02AM +0800, YueHaibing wrote:
> Fix sparse warning:
> 
> drivers/virtio/virtio_balloon.c:168:5: warning:
>  symbol 'virtballoon_free_page_report' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

This is for the mm tree right? You need to tag the subject
appropriately and copy the relevant lists.

> ---
>  drivers/virtio/virtio_balloon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 0ef16566c3f3..bc10f94718e3 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -165,8 +165,9 @@ static void tell_host(struct virtio_balloon *vb, struct virtqueue *vq)
>  
>  }
>  
> +static
>  int virtballoon_free_page_report(struct page_reporting_dev_info *pr_dev_info,
> -				   struct scatterlist *sg, unsigned int nents)
> +				 struct scatterlist *sg, unsigned int nents)
>  {
>  	struct virtio_balloon *vb =
>  		container_of(pr_dev_info, struct virtio_balloon, pr_dev_info);
> -- 
> 2.17.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

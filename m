Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931C39B472
	for <lists.virtualization@lfdr.de>; Fri,  4 Jun 2021 09:58:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7976183E6C;
	Fri,  4 Jun 2021 07:58:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1vViRP4OI3D; Fri,  4 Jun 2021 07:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62D80842FB;
	Fri,  4 Jun 2021 07:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFB8AC001C;
	Fri,  4 Jun 2021 07:58:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE671C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 07:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C522C4062B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 07:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jD-35fKtLu6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 07:58:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BC0A4064D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 07:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622793485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ijE1pTqJ41WHz6rwXA+sUBCq0HtCCMDO+vlAdF3MMZo=;
 b=NZtQ8a2HBfoH3H0ScB3s59bAPMmtExUQrcaEiPNYMODc7nMmX2eo1jLQME3WADkIlephXb
 0iF1XfZfMccJ31EV+g3u8Juarp1C5Dk0048AFg570fWQkS/JnwMbpqcRYLsHWQTnxe+CNq
 /1HSLpKYqbNW7kMR3l0Bp4u4NyJAorQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-DSB7b0dBNi6I1i45ofuObQ-1; Fri, 04 Jun 2021 03:58:01 -0400
X-MC-Unique: DSB7b0dBNi6I1i45ofuObQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 f1-20020a1709064941b02903f6b5ef17bfso3059039ejt.20
 for <virtualization@lists.linux-foundation.org>;
 Fri, 04 Jun 2021 00:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ijE1pTqJ41WHz6rwXA+sUBCq0HtCCMDO+vlAdF3MMZo=;
 b=GE/qpWvF1NO1DKAU+qMrq6nH6NU2O9Jl03PPUJgB5OH0lA4/+uPcFWCdm+ltUPEw+T
 YQ6BxM3fBFaxfZ5Oj0YVzRIq+DLr9SvDR3GSkZAp9AuEgpsa5+xfd0HEImycu5WcgNYN
 pISF1RRocUWuKNLvbKElqoWMx0gYUh5KNjFNG5r9q6tKLjOlJf6sHYRSLGqKj8hiGxBH
 AbmqcMtOOwelsBhQReVyb6qh9yZFegAAYJB2VAGmnqPCYFf/ZuppLRocJyF7EyNTr3D2
 dC3YXLPCzUGK4gK2NwJwQkKYs2UoZgnGik7QA371Rm5CZr9jkVZbCJBfGhInGmVh1GAp
 owhw==
X-Gm-Message-State: AOAM531/5zQsLVsHw4FseI/hCDZKTa/H/QLMBocTjXm0Ya8LoFrnrcJk
 ESaOanvBI/d9EdXVRLTMF4imMOWAn2H7XDp/2WeAFKljK8cDuwG1L/27VPZVQMGNYodG27OHgJc
 iEKGjTWzR6giIfxEKanwDlfp5+U75gtJFQq8J1ZiBDg==
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr2975476ejy.211.1622793480444; 
 Fri, 04 Jun 2021 00:58:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP44+2T+Zo6x8GpZCsoSBuzEEhmD8Fx/J6CPl5A7XREyZf4HGgU80zzZ6Okjs6N3aS0Oq7Ig==
X-Received: by 2002:a17:906:b104:: with SMTP id
 u4mr2975471ejy.211.1622793480307; 
 Fri, 04 Jun 2021 00:58:00 -0700 (PDT)
Received: from steredhat ([5.170.129.161])
 by smtp.gmail.com with ESMTPSA id n2sm2855332edi.32.2021.06.04.00.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 00:57:59 -0700 (PDT)
Date: Fri, 4 Jun 2021 09:57:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa: mandate 1.0 device
Message-ID: <20210604075756.z67ycpyonmhqs37k@steredhat>
References: <20210604050251.57834-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210604050251.57834-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: elic@nvidia.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, mst@redhat.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jun 04, 2021 at 01:02:51PM +0800, Jason Wang wrote:
>This patch mandates 1.0 for vDPA devices. The plan is never to support
>transitional devices for vDPA devices in the future.
>
>The reasons are:
>
>- To have the semantic of normative statement in the virtio spec and
>  eliminate the burden of transitional device for both vDPA bus and
>  vDPA parent
>- Eliminate the efforts for dealing with endian conversion in the
>  management tool
>- Mandate vDPA vendor to ship modern device instead of transitional
>  device which is easily broken and unsafe
>- Transitional device never work since the first day of vDPA
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> include/linux/vdpa.h | 6 ++++++
> 1 file changed, 6 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

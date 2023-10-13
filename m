Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12C7C81E4
	for <lists.virtualization@lfdr.de>; Fri, 13 Oct 2023 11:23:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D81582AF5;
	Fri, 13 Oct 2023 09:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D81582AF5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Brvgvi5U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id np3YW3-rUp8F; Fri, 13 Oct 2023 09:22:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6657A82AF8;
	Fri, 13 Oct 2023 09:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6657A82AF8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9576EC0DD3;
	Fri, 13 Oct 2023 09:22:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC0F5C0032
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Oct 2023 09:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F3441E46
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Oct 2023 09:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9F3441E46
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Brvgvi5U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J1W-tuek5QpW
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Oct 2023 09:22:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BA6D41BB3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Oct 2023 09:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BA6D41BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697188971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y79P95BNudFuWy4ZhGlYbCRHyPElKrXCG8x3TZEUCz4=;
 b=Brvgvi5U8rridS7lnhp9BGdfwXLDZ1SWIUmRBayLdNGIsXtZx9XraaxpfVd60xpiVeodrh
 mjP4cXtbiwUVlNU8q1esS267jyFg5z9g8vhhWvnT+l/JDGp0Z/miCJygvfm5FXGERhSc5p
 iwdQzmguatHtoM0EDaspDbTJpC9HGzU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-G23x7Bs5OVChxT-mu_y4TA-1; Fri, 13 Oct 2023 05:22:40 -0400
X-MC-Unique: G23x7Bs5OVChxT-mu_y4TA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-775d995f92aso237606385a.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Oct 2023 02:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697188960; x=1697793760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y79P95BNudFuWy4ZhGlYbCRHyPElKrXCG8x3TZEUCz4=;
 b=ifohcMeKhDNqV5MEVhbCCr/5VRq7tGQ157Rv8vekEYsjtizB+ZocNNZ6ELWnl8QVtQ
 8KrUyTpLswqjssbu7/YezM7rCAdMrSB/RPgBe+yj0sMNOlLiAdaYdc0GV2KsVwD/8iKD
 nCDhykCB14ThgjuLWoxc0Sx4TwsMYQ6aSBcNmBY66MX3xqYTw4cGIy07WqPPr5XrIK5I
 NNCJXwGIrCCf1kSIIwId8YIyScfV3KEmk/+mwFdvuQA97+uj1NODqruNg1YU7kra/9dV
 BM5LUV/+cLREprhoFoNx86icoi/lv6MQ+hBtCzSkhHJoXv6ZLr3vzMayImfMJ399ITsC
 InBw==
X-Gm-Message-State: AOJu0YxKCoGWFPODOMhQMekEWS8ONitGOTyWxwEfAC4H2kZztL2HdufQ
 GF3GTBYJ5IKR5a8ryZuTB35KJdFgutGp4txeoNx0RIXQtMQJN+VRPeh6OOOWYF/n/AHKBdY3UqV
 q4afjWuH16Auqk1sy2hmATpZYV+GZlj/krr4RSfTB1g==
X-Received: by 2002:a05:620a:d85:b0:770:70d6:417c with SMTP id
 q5-20020a05620a0d8500b0077070d6417cmr30517229qkl.33.1697188960019; 
 Fri, 13 Oct 2023 02:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7yQXWpfoJ05zTNZZ3hijxAkmU5shyP7Ol6Sd7hHjzaaIhP+h/JsELmfnvxIgO7AnjSGmhuw==
X-Received: by 2002:a05:620a:d85:b0:770:70d6:417c with SMTP id
 q5-20020a05620a0d8500b0077070d6417cmr30517223qkl.33.1697188959805; 
 Fri, 13 Oct 2023 02:22:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-251.retail.telecomitalia.it.
 [79.46.200.251]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05620a132900b0077434d0f06esm476063qkj.52.2023.10.13.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 02:22:39 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:22:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Subject: Re: [RFC PATCH] vdpa_sim: implement .reset_map support
Message-ID: <4o4yuuezigilikolv2paxb7icrsm3gdnj5aeoe47uotzju7xve@s5vqaafrppdv>
References: <1697185420-27213-1-git-send-email-si-wei.liu@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1697185420-27213-1-git-send-email-si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: eperezma@redhat.com, virtualization@lists.linux-foundation.org,
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

Hi Si-Wei,

On Fri, Oct 13, 2023 at 01:23:40AM -0700, Si-Wei Liu wrote:
>RFC only. Not tested on vdpa-sim-blk with user virtual address.

I can test it, but what I should stress?

>Works fine with vdpa-sim-net which uses physical address to map.

Can you share your tests? so I'll try to do the same with blk.

>
>This patch is based on top of [1].
>
>[1] 
>https://lore.kernel.org/virtualization/1696928580-7520-1-git-send-email-si-wei.liu@oracle.com/

The series does not apply well on master or vhost tree.
Where should I apply it?

If you have a tree with all of them applied, will be easy for me ;-)

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

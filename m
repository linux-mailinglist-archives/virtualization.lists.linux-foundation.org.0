Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FF23AF5C6
	for <lists.virtualization@lfdr.de>; Mon, 21 Jun 2021 21:02:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA3682656;
	Mon, 21 Jun 2021 19:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcAXEmkEQkQ8; Mon, 21 Jun 2021 19:02:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DBD218264C;
	Mon, 21 Jun 2021 19:02:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E3D1C0021;
	Mon, 21 Jun 2021 19:02:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81C3DC000C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 19:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55520404B7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 19:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GaKifQlVd6N2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 19:02:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76B94403DF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 19:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624302160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t4nTBVm6oy+3JIkEZh+pQ7A07CqilJib+PKS9NOLN6c=;
 b=OV7wtOGY2yIbMhUpv1wcbOORTwprl45nARKp+OwLUq58TcX1oNORjuYI71A7o2fvZzVGuP
 EqUI+OCWncvHdmiQaaBM59F0b50vyTcvw2uGkTb1qCR7CKhZIDAPpny9fquLsHcJVl1q/M
 qNsWKyheW9Fq4GiMt853mH/+LmPz7Uc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-0GuIsSACPWulHNWHt8OTpg-1; Mon, 21 Jun 2021 15:02:39 -0400
X-MC-Unique: 0GuIsSACPWulHNWHt8OTpg-1
Received: by mail-wr1-f69.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so8751662wrc.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 12:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t4nTBVm6oy+3JIkEZh+pQ7A07CqilJib+PKS9NOLN6c=;
 b=aloNNuyi321u/LP5lBlSjN9HLeu1UDL6kZVRW5uibHUpOe/Ia1mWJ07HRG0+IT66rM
 Wy0p7Jt699HYHqcum6Utr5AGc6VI2cWAskugk/vo5fZmEAjSqp5L2UuCI8G0BZxOhcwf
 RsFjiBPWU8bdPH5uqAZFrzJuCutvxfNXk8M9N8txxLt4wiYpv+DT6B58ALIY0QaQsTFw
 KhXX3dvao89tX1jJqzKtVJDv4JozwIW7+ZBhjtCRQ3W/7wz/gJBxcnc+60RcCRxdJ95c
 gPrYv7WMFcPDLnALhy+14AQyhp6GfbMT7V6jm/QxA6HQOfzcyTPiTzWSZrNdIQ5WgVS1
 wcpw==
X-Gm-Message-State: AOAM532iNHTxcmgDbBPxeEbC+kRaE247MdnEnObNCVFPDT/bDXK2zKdV
 6/3zy581nQ5WPoNxltQVCBcLY5DTrU6V4T8VhO0lPtytx+A6rm/Nk5xiAcvrSHWoesmTTYnOKG+
 9GdkE+BUr2gbMoM/BqdQ1sCN6I72S6EM009SfPKK2UA==
X-Received: by 2002:a1c:9895:: with SMTP id
 a143mr28697583wme.158.1624302157995; 
 Mon, 21 Jun 2021 12:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIym+Kqwn0g2XmY5hu8xWQygedShFaccTRqlgFj+vU/VKW+LszZezJYBBI4t+19M3QUjQtlA==
X-Received: by 2002:a1c:9895:: with SMTP id
 a143mr28697571wme.158.1624302157894; 
 Mon, 21 Jun 2021 12:02:37 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id k16sm19459817wrn.96.2021.06.21.12.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 12:02:37 -0700 (PDT)
Date: Mon, 21 Jun 2021 15:02:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: Patches that were reviewed
Message-ID: <20210621150202-mutt-send-email-mst@kernel.org>
References: <20210621125237.GC143139@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
In-Reply-To: <20210621125237.GC143139@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

On Mon, Jun 21, 2021 at 03:52:37PM +0300, Eli Cohen wrote:
> Hi Michael,
> 
> There have been several patches that were sent and reviewed during the
> last few weeks. I can't find them in your linux-next branch and we're
> already in 5.13-rc7.
> 
> Can you advice how I can track which patches you intend to merge?
> 
> Thanks,
> Eli

Hi Eli,
I'll push my branch in a day or two, then you will see it.
Thanks!

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

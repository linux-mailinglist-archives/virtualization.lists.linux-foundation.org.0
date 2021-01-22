Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 697312FFE3A
	for <lists.virtualization@lfdr.de>; Fri, 22 Jan 2021 09:35:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EB90A274FC;
	Fri, 22 Jan 2021 08:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8Z8YdurlPWm; Fri, 22 Jan 2021 08:35:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 318CC274E2;
	Fri, 22 Jan 2021 08:35:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12FF5C013A;
	Fri, 22 Jan 2021 08:35:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDEF4C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 08:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA4A386D37
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 08:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STpgaTR2QIoa
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 08:34:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DC1BF866F4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611304496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QhDv0nxBGDatOm8oAEr+e4jVMJT3FNAwSVks1BSxV64=;
 b=LaoXIevbVoDxsgzAKjflG1xe2sGi/oUBeOkjnvShVK8iBNukKwnATAYE7dU/P2H+uAoBuY
 iF0iRWjw5ezXrb2cE+z4Y7GN0UOnMW2HC/jfC/e6L2+z6M/fACYYyvMKmnLOC/nkZIJXGb
 ezfE/gVYJp3sSBXo84bYCV6mHypV3+0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-zvOuDuw5NwKcddQmGkNsOg-1; Fri, 22 Jan 2021 03:34:54 -0500
X-MC-Unique: zvOuDuw5NwKcddQmGkNsOg-1
Received: by mail-wm1-f70.google.com with SMTP id 5so1442058wmq.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 00:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QhDv0nxBGDatOm8oAEr+e4jVMJT3FNAwSVks1BSxV64=;
 b=Xr2acphw50Ytuc83YRed2kbOOw66AjQmJhzf+cd0c8LEqQBxe0LShmCxNOd6Utac1K
 8fIIky4Vgw/InZZkmcJu46H5s27FH2GBE+Ue4sr/T98QgV3sMO3vtgnreycSJvxHxNwr
 ompJCQ+sff0Ge4Mx4+bd3JpCWNdEBOhigDEyFY9Dnh2+BItdjE8GCHPWO8YH2/E3sAnz
 keocLsCvu5WnTAVt0YI97q+qX/K+aIWeN0DQ4sBUz4SC0H9a2em/dY3j/K2Mtr0WKhdR
 R4wmeud+lNRE6mnDliS5ZEiymuLN8ei4Nkt/gvih1WkUNa+mIUDMtUju6pix3hdMJtfU
 Nfyg==
X-Gm-Message-State: AOAM530Y1vk1E+rFyc424jYix0OTsh6M7aKb1nU83WRZ3VVclEEy/AwS
 59JuZzwn+XlHrEu+ILj9DrmzUlFs2aM1FXfrcMEOjrJqufNSPZ4EGgorQXmHvCy4TkCDru4GHaH
 ic/MSZYjdSmO2oa4HvBrxpr8yd7Fd2TfWTa4GZNgtQQ==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr2732058wmi.107.1611304493731; 
 Fri, 22 Jan 2021 00:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdudmKkbtLpbzfTDbDMVvXKnLxQMKgl/CJb+L2NpJNINqIzeqlIGOBx/OM8WOS7lMr7QiepA==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr2732046wmi.107.1611304493570; 
 Fri, 22 Jan 2021 00:34:53 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id d85sm32712120wmd.2.2021.01.22.00.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 00:34:52 -0800 (PST)
Date: Fri, 22 Jan 2021 03:34:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: Re: [PATCH RFC] virtio-blk: support per-device queue depth
Message-ID: <20210122033412-mutt-send-email-mst@kernel.org>
References: <1610942338-78252-1-git-send-email-joseph.qi@linux.alibaba.com>
 <405493e0-7917-2ee9-7242-5f02c044a0fb@redhat.com>
 <ce313c74-645f-3a55-44ac-4e757497c778@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <ce313c74-645f-3a55-44ac-4e757497c778@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-block@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Fri, Jan 22, 2021 at 09:43:27AM +0800, Joseph Qi wrote:
> Hi Michael,
> 
> Any comments on this patch?
> 
> Thanks,
> Joseph

Suggest copying all reviewers, including Paolo Bonzini
<pbonzini@redhat.com> and Stefan Hajnoczi <stefanha@redhat.com>.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

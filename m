Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42216438E
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 12:41:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A57185E06;
	Wed, 19 Feb 2020 11:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8yZ78cYtqRM9; Wed, 19 Feb 2020 11:41:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B99485E25;
	Wed, 19 Feb 2020 11:41:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14C1CC013E;
	Wed, 19 Feb 2020 11:41:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7834FC1D81
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 739AD84C3E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3aKs-N-JZo8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:41:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6A3CA84028
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 11:41:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so154520wru.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7KmHROk/Pu3uLEn3/2SxZI46IHOQU1//cLTBR6+z/LE=;
 b=WUJKrbrzFy/sy2qsJp7fTAe/VOrbIljeFdqp59wSerauEf8i5OXz4J0jr7NxbX9IH3
 NNohkIKk8nlCf2LywFE+Tp+Ky2f9qqT3C1FYpT17eeNWVKQmbAw8jxBga0QXY9sAXQ/b
 p3Z9SLGUm+DIucZVHfPnrycbWh1ladw9BKhwBqLR4GzNUnjclXY0zSfuBUe2QvOAwDyq
 +OaPvdcgfmofkwrV9IIL1S3whtFBZk9oZmWjylSq+JX7DJeaZWwaPN3cbm4cuMIxEHVz
 lLCmTx/F9nk87DFyTRPe88XFGB8RHPjXFhMqZhx5I8lhBE0rvUpo0PoMEYKxI1XZbLNn
 cv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7KmHROk/Pu3uLEn3/2SxZI46IHOQU1//cLTBR6+z/LE=;
 b=KRH2r/PV+UkJZf0o4L2OzAfAC9qEeNO0F2wnw5tQOs5rCLkbfjCYhPwZ1D4Co9feJK
 j5xhDvnPhWPz/+DOtLDwpLGdRvmb8aykOoFeYXSK0Rc0nSISrpEdRwta+ZVWSNXZsWWU
 zSZx0aezPttVUpQk3Bd2+aoMqway3yjGTjGkrRMA9s16fdVlZAY7HezZwxXxouvpHHs+
 TJStVjNgsyXNFME1y6TW3VdvUCOSfXJL9VrgBOw1hYKKAeeFtouStBKF6PPQto1rlUFI
 sFz1Ln8a5CzSGquqo2BEuSFr6yGsE3DvWEEbQvsQauPYAVHpiInSK5bqttV+LY9cABvj
 IDEQ==
X-Gm-Message-State: APjAAAX5iJUjcXvnDlE+6u9+djeiDpJjE/Yvzaq2VaicNDn+XkVZ56Dw
 7sMRAVJxspi1cmcAnswjcYDvZw==
X-Google-Smtp-Source: APXvYqxD5lwbhqsRdA1OEyTadbDFXGtbvDGbouOM54QiYfpWsh+wkqqwg5Yf0w334p1j8aioO4lCTg==
X-Received: by 2002:adf:94e3:: with SMTP id 90mr35017844wrr.268.1582112500664; 
 Wed, 19 Feb 2020 03:41:40 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id z6sm2563269wrs.96.2020.02.19.03.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 03:41:39 -0800 (PST)
Date: Wed, 19 Feb 2020 12:41:33 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/virtio: Build virtio-iommu as module
Message-ID: <20200219114133.GA156984@myrica>
References: <20200214163827.1606668-1-jean-philippe@linaro.org>
 <20200219111604.GH1961@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219111604.GH1961@8bytes.org>
Cc: iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
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

Hi Joerg,

On Wed, Feb 19, 2020 at 12:16:04PM +0100, Joerg Roedel wrote:
> On Fri, Feb 14, 2020 at 05:38:27PM +0100, Jean-Philippe Brucker wrote:
> > From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> > 
> > Now that the infrastructure changes are in place, enable virtio-iommu to
> > be built as a module. Remove the redundant pci_request_acs() call, since
> > it's not exported but is already invoked during DMA setup.
> 
> Which infrastructure changes do you mean? Does this depend on the x86
> enablement patch-set in any way?

No, I meant Will's changes in 5.6 to make the SMMU drivers modular. This
patch doesn't depend on the x86 enablement patch-set, but there is a small
conflict in Kconfig since they both modify it (locally I have this patch
applied on top of the x86 enablement).

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

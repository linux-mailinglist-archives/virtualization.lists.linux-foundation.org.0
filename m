Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4645AE26
	for <lists.virtualization@lfdr.de>; Tue, 23 Nov 2021 22:16:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35B044018D;
	Tue, 23 Nov 2021 21:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpIqPUVBBess; Tue, 23 Nov 2021 21:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B394940374;
	Tue, 23 Nov 2021 21:16:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DF1BC0036;
	Tue, 23 Nov 2021 21:16:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9501C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF44160754
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myvOoXViFVsB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C04E160747
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:16:03 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id x7so581985pjn.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 13:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+zpQrvL4Qxe/qyBBz6nO1x+ZudVJHE22cDmvcF/TOE=;
 b=3UTjzt/B58bzUMuj7IqqMnaCu5WYQAV5rK+fs5kaCfP78gUwTgy5Zlf3Be+wmIjr56
 TnFB+KlAOrzucg0BEhVOP/JXfiAUD2ftEQJXj4AikeXTgWe03Spusb/0TUld0hhFX8v6
 hoRoYhcMIe1fJGrizIl0u8fu7pfvZl0yQ6G/HZ/XblMR0kOZLIsIbaNzfqww2OtwK0QY
 M2kpeuFwFxk8ZGruQVPxMGdqTXvMTUs/jjMoa2NVuNjPrbZJxiRI6LrTQ3lIM/koJIif
 rP8I79qIKGLZ1fswpluH9sZNHRVBAzv8KTrCcmchw/ruDBCNrZVPKtgfRhQ9/KytnoiJ
 mPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+zpQrvL4Qxe/qyBBz6nO1x+ZudVJHE22cDmvcF/TOE=;
 b=nbt/EAxDO83gmqczzYWRBqDsDcDxJ9cr4/1ZSvH+Tfw3xTBdQhekkAiAcrDsH0Dl9r
 UGmU8woA4nS4kgARA6VzD9e6or5bbBadCIcv1PEtssL6HJV/dDQQO5LFKMiV6eoxs7Hr
 BkiMyLkmBAjRVxu6VLYlZAvtMNGt87uOJWA+tN2YVAzpR5sAIM6nk9JiEYvyC6wbQ3dz
 Mo/q17BvmzSmy5WrwNsmXWVpD/n+7n12oBfCGXEgqF7Sa8cuGPxcC2vxuQZ+p1lt4AcR
 Zz7P15rSUTY1O76v5fRBNrPXz60i/E7+HdgNEooeH2eElXS/NWe7UEA863vFf+nJGTOO
 SvLg==
X-Gm-Message-State: AOAM533wyTdQIDHqAxl2tAdVF8Q1o9vMrMGL348gVuVvqjvV66kk3uiZ
 nJqKi5Vf63QxutA0NsmWOOxcd/ltwToeJilJbeab8A==
X-Google-Smtp-Source: ABdhPJxRRlv0NZQorv0M5t2wTRvBAaxVZY2wmbRu89506wlORAkd8KhXvCTyC5EAm4rzXSOWToX/mEdJ14fdPpKfw3k=
X-Received: by 2002:a17:90b:1e07:: with SMTP id
 pg7mr494044pjb.93.1637702163126; 
 Tue, 23 Nov 2021 13:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-16-hch@lst.de>
In-Reply-To: <20211109083309.584081-16-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 23 Nov 2021 13:15:52 -0800
Message-ID: <CAPcyv4jDqfNj4iAYoewj53QEZjXR41UuE0LN49CtC_2qjrbazg@mail.gmail.com>
Subject: Re: [PATCH 15/29] xfs: add xfs_zero_range and xfs_truncate_page
 helpers
To: Christoph Hellwig <hch@lst.de>
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>,
 Shiyang Ruan <ruansy.fnst@fujitsu.com>
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

On Tue, Nov 9, 2021 at 12:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> From: Shiyang Ruan <ruansy.fnst@fujitsu.com>
>
> Add helpers to prepare for using different DAX operations.
>
> Signed-off-by: Shiyang Ruan <ruansy.fnst@fujitsu.com>
> [hch: split from a larger patch + slight cleanups]
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

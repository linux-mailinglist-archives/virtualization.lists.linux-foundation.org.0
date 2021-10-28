Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C15AF43D8AC
	for <lists.virtualization@lfdr.de>; Thu, 28 Oct 2021 03:36:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CF0D60658;
	Thu, 28 Oct 2021 01:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UBQEBPyHoqK; Thu, 28 Oct 2021 01:36:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 17B7B6066A;
	Thu, 28 Oct 2021 01:36:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D900C000E;
	Thu, 28 Oct 2021 01:36:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3492FC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A2346066A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:36:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bWnf_IAuBVvv
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:36:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E3DD60665
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:36:23 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id l203so4464577pfd.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 18:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h7Igm7cptJn/BPiAKOvXNcYjYvau2fVkwbEBPR40Qac=;
 b=nDN9pMycEij+MvvSNlzKvOXo8vpzX9jkSPwoFJ+o4gm3MZL73HDZVz6xJnzjMcbY/h
 uxqb8I8SZcSxzyFyBYzX7/LIRnqjurLkxyKCXt7vyn4OmQMNyDT08nPuKyqwzm30Iyl3
 YY7ptNRp5CFdB0o2rG3ZcydKtS+P5TBWxjp9noe/kCn6hPByhWq1BSGoPPpBqB7Delwx
 7OpBf+W0FVyg/SVq09iZbg3g6KwhgjDGpF6ftYJKhyxVAQrctr7Lax8JbvRVtA2fECbQ
 ljET309ufBhSYyMPecwX45v0eqgX6tTFFZvO7U3Ppi7VtOy0tKDgD/ePUmL2riKDB8uo
 7IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h7Igm7cptJn/BPiAKOvXNcYjYvau2fVkwbEBPR40Qac=;
 b=ZqLfEsXhxmVW9Qmclflz9J3TwDdnFZK9POkNg3eIbWPYh9xVt5AStQtpRuq4XGqepa
 aiNavpQytUthhzZ42QNq6HJ/shM5LUDMOtnfIr7Kx4DtjRWL5u8PqdCu0UUCTIp5a7Sx
 TV94WkMzrBRsQDnYXx3RBCN6dQ6osSYzzGVxaVco0KYwQPB5Sn9m1UKfxc4H8SOWfuZj
 byib5t9WEad/zKE2oeLxRv0vtQQQYnCUPnJhi08flcOFMDXTmRGFAf7UOMaQcyhlJeLW
 Y7pZ1e+GDLUvujkCCO9LKrOBX+SP/bkRGF9V+jUJWH+SHM9O/rZvbV/12t9qTJza6xuD
 G4QA==
X-Gm-Message-State: AOAM532WIrmy+CyBiM7nD6ZRMoKRN0eueq42AqhisRo+QVZSxpumCdaG
 vW78fE+qGpxEvkl6PT7NJNs/4HcQxtrABSQlzP8pOw==
X-Google-Smtp-Source: ABdhPJyDv7rjKjhKzGrFppXBu1eyKYCO/S0EEDW+vfLySK20rv/agORLXNPU8PUP/nGzDZcfnIyFx3qV7wWhC+ogeBA=
X-Received: by 2002:a05:6a00:140e:b0:444:b077:51ef with SMTP id
 l14-20020a056a00140e00b00444b07751efmr1317245pfu.61.1635384983516; Wed, 27
 Oct 2021 18:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211018044054.1779424-1-hch@lst.de>
 <20211018044054.1779424-10-hch@lst.de>
In-Reply-To: <20211018044054.1779424-10-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 27 Oct 2021 18:36:11 -0700
Message-ID: <CAPcyv4iaUPEo73+KsBdYhM72WqKqJpshL-YU_iWoujk5jNUhmA@mail.gmail.com>
Subject: Re: [PATCH 09/11] dm-log-writes: add a log_writes_dax_pgoff helper
To: Christoph Hellwig <hch@lst.de>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>
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

On Sun, Oct 17, 2021 at 9:41 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to perform the entire remapping for DAX accesses.  This
> helper open codes bdev_dax_pgoff given that the alignment checks have
> already been done by the submitting file system and don't need to be
> repeated.

Looks good.

Mike, ack?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

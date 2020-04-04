Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F019E42A
	for <lists.virtualization@lfdr.de>; Sat,  4 Apr 2020 11:41:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A62812040D;
	Sat,  4 Apr 2020 09:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rzl7ql+yrrGt; Sat,  4 Apr 2020 09:41:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ADC94203A2;
	Sat,  4 Apr 2020 09:41:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 721BFC1AE2;
	Sat,  4 Apr 2020 09:41:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F685C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 448EC203A2
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tGqJ1HvDkA8X
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 4B8E82033D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  4 Apr 2020 09:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WdsCUkqz+ZpftO7Mf21Mzxh3783sco48fV7R9K5+cSI=; b=PELXH5ny0M3kB+GT2d8Pd5dD9q
 8eanzcnxkv+aCZo7xU0MTLzbvHbFLRHyVQouUh6JEjIJaO0V5GxWO92Ywe09m95JPqXzd7HiGKqlm
 jW2BNwUQ2BtPIZ5kE6znphfh0jXoXYAcstagyulmremdMh291CUui94WRBcUPNWOAdQzqn5nfvSp9
 wzb7CZc9Qjt0wrAkoz7EHRrJOG0f0ZGg3YNyhb6HyaGU8uJKs2EX+nSZPB8n0IXDvXq/eW66dDriv
 z9PXCQgcdAm8Gv8jY0EKvfNz1aM4G5PN1Z1U6hgvGS5PaLbNtEoMK6qUpnowB9MtGYPkdq0+1JT6U
 CwulSteA==;
Received: from [2001:4bb8:180:7914:2ca6:9476:bbfa:a4d0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKfIW-0002cl-88; Sat, 04 Apr 2020 09:41:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: improve use_mm / unuse_mm
Date: Sat,  4 Apr 2020 11:40:55 +0200
Message-Id: <20200404094101.672954-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 amd-gfx@lists.freedesktop.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-usb@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
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

Hi all,

this series improves the use_mm / unuse_mm interface by better
documenting the assumptions, and my taking the set_fs manipulations
spread over the callers into the core API.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

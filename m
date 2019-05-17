Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC0821C5E
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 19:24:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 891ABC11;
	Fri, 17 May 2019 17:24:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13958B09
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 17:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ADB3087A
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 17:24:31 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E9E9820848;
	Fri, 17 May 2019 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558113871;
	bh=WxXSWaL3QpOrEgpKs084IjnKXSpNSZZ904f35QLLVA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xjySCgF4FaNrp2+ct/3zpw36OkzervYSiIGfEc3YR7ztGWqF5SEeoFfXndGtiUVJg
	E2/3NiTghwHTC6PlkuWja+NwFSOvLjeFjsHyPgGMw9ppidBJbhmRsuk41xoJysH+06
	3jbCOCNfN2SaQdhlSzsRZ4nRXki+IrOTjXTxY5Ts=
Date: Fri, 17 May 2019 19:24:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v4 0/4] vmw_balloon: Compaction and shrinker support
Message-ID: <20190517172429.GA21509@kroah.com>
References: <20190425115445.20815-1-namit@vmware.com>
	<8A2D1D43-759A-4B09-B781-31E9002AE3DA@vmware.com>
	<9AD9FE33-1825-4D1A-914F-9C29DF93DC8D@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9AD9FE33-1825-4D1A-914F-9C29DF93DC8D@vmware.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Arnd Bergmann <arnd@arndb.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	Pv-drivers <Pv-drivers@vmware.com>, lkml <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, Linux-MM <linux-mm@kvack.org>,
	Julien Freche <jfreche@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, May 17, 2019 at 05:10:23PM +0000, Nadav Amit wrote:
> > On May 3, 2019, at 6:25 PM, Nadav Amit <namit@vmware.com> wrote:
> > 
> >> On Apr 25, 2019, at 4:54 AM, Nadav Amit <namit@vmware.com> wrote:
> >> 
> >> VMware balloon enhancements: adding support for memory compaction,
> >> memory shrinker (to prevent OOM) and splitting of refused pages to
> >> prevent recurring inflations.
> >> 
> >> Patches 1-2: Support for compaction
> >> Patch 3: Support for memory shrinker - disabled by default
> >> Patch 4: Split refused pages to improve performance
> >> 
> >> v3->v4:
> >> * "get around to" comment [Michael]
> >> * Put list_add under page lock [Michael]
> >> 
> >> v2->v3:
> >> * Fixing wrong argument type (int->size_t) [Michael]
> >> * Fixing a comment (it) [Michael]
> >> * Reinstating the BUG_ON() when page is locked [Michael] 
> >> 
> >> v1->v2:
> >> * Return number of pages in list enqueue/dequeue interfaces [Michael]
> >> * Removed first two patches which were already merged
> >> 
> >> Nadav Amit (4):
> >> mm/balloon_compaction: List interfaces
> >> vmw_balloon: Compaction support
> >> vmw_balloon: Add memory shrinker
> >> vmw_balloon: Split refused pages
> >> 
> >> drivers/misc/Kconfig               |   1 +
> >> drivers/misc/vmw_balloon.c         | 489 ++++++++++++++++++++++++++---
> >> include/linux/balloon_compaction.h |   4 +
> >> mm/balloon_compaction.c            | 144 ++++++---
> >> 4 files changed, 553 insertions(+), 85 deletions(-)
> >> 
> >> -- 
> >> 2.19.1
> > 
> > Ping.
> 
> Ping.
> 
> Greg, did it got lost again?


I thought you needed the mm developers to ack the first patch, did that
ever happen?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF552CF19F
	for <lists.virtualization@lfdr.de>; Fri,  4 Dec 2020 17:12:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A15B87CAF;
	Fri,  4 Dec 2020 16:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IU3KyVMLL8ap; Fri,  4 Dec 2020 16:12:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13C5E87CAD;
	Fri,  4 Dec 2020 16:12:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0F36C013B;
	Fri,  4 Dec 2020 16:12:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 407C7C013B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 16:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E39D87CAB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 16:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YL3yeBTaP+BY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 16:12:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0184.hostedemail.com
 [216.40.44.184])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E0CF87CA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  4 Dec 2020 16:12:18 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 24D69180A9F34;
 Fri,  4 Dec 2020 16:12:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10, 1, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6119:6248:6691:7903:8957:9025:10004:10400:10848:11232:11658:11914:12043:12297:12438:12555:12660:12740:12760:12895:13069:13311:13357:13439:13845:14096:14097:14181:14659:14721:14777:21080:21433:21450:21451:21627:21811:21889:21990:30054:30056:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: hen76_3903285273c5
X-Filterd-Recvd-Size: 3208
Received: from XPS-9350.home (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri,  4 Dec 2020 16:12:14 +0000 (UTC)
Message-ID: <235b856857d912d93ea00685b20baa5b66800c83.camel@perches.com>
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Fri, 04 Dec 2020 08:12:13 -0800
In-Reply-To: <20201204154911.GZ643756@sasha-vm>
References: <20201129041314.GO643756@sasha-vm>
 <7a4c3d84-8ff7-abd9-7340-3a6d7c65cfa7@redhat.com>
 <20201129210650.GP643756@sasha-vm>
 <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
 <20201130173832.GR643756@sasha-vm>
 <238cbdd1-dabc-d1c1-cff8-c9604a0c9b95@redhat.com>
 <9ec7dff6-d679-ce19-5e77-f7bcb5a63442@oracle.com>
 <4c1b2bc7-cf50-4dcd-bfd4-be07e515de2a@redhat.com>
 <20201130235959.GS643756@sasha-vm>
 <6c49ded5-bd8f-f219-0c51-3500fd751633@redhat.com>
 <20201204154911.GZ643756@sasha-vm>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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

On Fri, 2020-12-04 at 10:49 -0500, Sasha Levin wrote:
> On Fri, Dec 04, 2020 at 09:27:28AM +0100, Paolo Bonzini wrote:
> > On 01/12/20 00:59, Sasha Levin wrote:
> > > 
> > > It's quite easy to NAK a patch too, just reply saying "no" and it'll be
> > > dropped (just like this patch was dropped right after your first reply)
> > > so the burden on maintainers is minimal.
> > 
> > The maintainers are _already_ marking patches with "Cc: stable".  That 
> 
> They're not, though. Some forget, some subsystems don't mark anything,
> some don't mark it as it's not stable material when it lands in their
> tree but then it turns out to be one if it sits there for too long.
> 
> > (plus backports) is where the burden on maintainers should start and 
> > end.  I don't see the need to second guess them.
> 
> This is similar to describing our CI infrastructure as "second
> guessing": why are we second guessing authors and maintainers who are
> obviously doing the right thing by testing their patches and reporting
> issues to them?
> 
> Are you saying that you have always gotten stable tags right? never
> missed a stable tag where one should go?

I think this simply adds to the burden of being a maintainer
without all that much value.

I think the primary value here would be getting people to upgrade to
current versions rather than backporting to nominally stable and
relatively actively changed old versions.

This is very much related to this thread about trivial patches
and maintainer burdening:

https://lore.kernel.org/lkml/1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com/


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

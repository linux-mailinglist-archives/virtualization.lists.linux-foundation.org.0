Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B37AC2C85F8
	for <lists.virtualization@lfdr.de>; Mon, 30 Nov 2020 14:57:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F32B872AF;
	Mon, 30 Nov 2020 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9H4xE+t+v-9; Mon, 30 Nov 2020 13:57:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DD3388729A;
	Mon, 30 Nov 2020 13:57:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C78FC0052;
	Mon, 30 Nov 2020 13:57:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26D58C0052
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 13:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 16DAE22882
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 13:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0gnes+ldlya
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 13:57:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D254320353
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 13:57:30 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 205312076E;
 Mon, 30 Nov 2020 13:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606744650;
 bh=iyc/zT3Z69BkU1MFcgEbohwAlNY5zEcNlqG/+vhqKxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cdxfjIdnmP3FHAVkDnr/b4mnJNr3fwiHX+Tf6PDk2ypzF0IXTO17jp+lfmKKerS+X
 pZEOGQZ91YVEhY6YgPUJrxgbKxC0nZKHeb5/oWxPk3j5DlRjOR/LSKz9RK/D/eLRSc
 WUKfIHUgVOQ+94hDTyZ5Vq0EOtYRz3MeKKkyUc6k=
Date: Mon, 30 Nov 2020 14:57:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
Message-ID: <X8T6RWHOhgxW3tRK@kroah.com>
References: <20201125153550.810101-22-sashal@kernel.org>
 <25cd0d64-bffc-9506-c148-11583fed897c@redhat.com>
 <20201125180102.GL643756@sasha-vm>
 <9670064e-793f-561e-b032-75b1ab5c9096@redhat.com>
 <20201129041314.GO643756@sasha-vm>
 <7a4c3d84-8ff7-abd9-7340-3a6d7c65cfa7@redhat.com>
 <20201129210650.GP643756@sasha-vm>
 <e499986d-ade5-23bd-7a04-fa5eb3f15a56@redhat.com>
 <X8TzeoIlR3G5awC6@kroah.com>
 <17481d8c-c19d-69e3-653d-63a9efec2591@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17481d8c-c19d-69e3-653d-63a9efec2591@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

On Mon, Nov 30, 2020 at 02:52:11PM +0100, Paolo Bonzini wrote:
> On 30/11/20 14:28, Greg KH wrote:
> > > > Lines of code is not everything. If you think that this needs additional
> > > > testing then that's fine and we can drop it, but not picking up a fix
> > > > just because it's 120 lines is not something we'd do.
> > > Starting with the first two steps in stable-kernel-rules.rst:
> > > 
> > > Rules on what kind of patches are accepted, and which ones are not, into the
> > > "-stable" tree:
> > > 
> > >   - It must be obviously correct and tested.
> > >   - It cannot be bigger than 100 lines, with context.
> > We do obviously take patches that are bigger than 100 lines, as there
> > are always exceptions to the rules here.  Look at all of the
> > spectre/meltdown patches as one such example.  Should we refuse a patch
> > just because it fixes a real issue yet is 101 lines long?
> 
> Every patch should be "fixing a real issue"---even a new feature.  But the
> larger the patch, the more the submitters and maintainers should be trusted
> rather than a bot.  The line between feature and bugfix _sometimes_ is
> blurry, I would say that in this case it's not, and it makes me question how
> the bot decided that this patch would be acceptable for stable (which AFAIK
> is not something that can be answered).

I thought that earlier Sasha said that this patch was needed as a
prerequisite patch for a later fix, right?  If not, sorry, I've lost the
train of thought in this thread...

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

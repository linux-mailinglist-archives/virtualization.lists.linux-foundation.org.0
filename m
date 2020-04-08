Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CE1A244C
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 16:49:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA72D86BA4;
	Wed,  8 Apr 2020 14:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKoXC6gG9xF5; Wed,  8 Apr 2020 14:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B35786B92;
	Wed,  8 Apr 2020 14:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 362F3C0177;
	Wed,  8 Apr 2020 14:49:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC50BC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 14:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 73D3420434
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 14:49:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeqbmit7Qe4v
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 14:49:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id BDE9520430
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=N8ykcQQ3SOpdB5xsAT3pwV11DGg8xQH7SevAPGdtwTg=; b=YOq7ZrDsmTyGEBcCI6BSDKkjsL
 I0uT/nJsD58Z+VHPMPAHi0wRyC61w6xXBMjcZFL/2mAsz2fbtr2mmjek7SrHTS63SneNCwGwzHyPL
 S6MegKRHQ/nk/fGNaJ8Yz3jQF01jD37BeyYMXiT7eN6emnX4N2gqwsKwlbXITRiIhFb2j8OdeEA6i
 EFM6XQ1O24xEkXwi2ZPKN/MNkvCJD42WZQ91uLBB3Kz9N8eWpkQrZbjuPLmlGMfjS+qjHTXkSzn8v
 TUIi2+UWQ5UwjS0BvK/up5CVJDBsoMmz8NqwVB+LGs7/FnCAsL8VncXNigzzuY1EjQvss6OMnwXmk
 pkaGs/vw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMC0r-00044L-OE; Wed, 08 Apr 2020 14:49:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4BFC5305FB6;
 Wed,  8 Apr 2020 16:49:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 3E3F52BA90A66; Wed,  8 Apr 2020 16:49:07 +0200 (CEST)
Date: Wed, 8 Apr 2020 16:49:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
Message-ID: <20200408144907.GL20730@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408120856.GY20713@hirez.programming.kicks-ass.net>
 <bcf8206d-5a41-4e6b-1832-75ba1d6367e4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcf8206d-5a41-4e6b-1832-75ba1d6367e4@suse.com>
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, boris.ostrovsky@oracle.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Apr 08, 2020 at 03:33:52PM +0200, J=FCrgen Gro=DF wrote:
> On 08.04.20 14:08, Peter Zijlstra wrote:
> > On Tue, Apr 07, 2020 at 10:02:57PM -0700, Ankur Arora wrote:
> > > Mechanism: the patching itself is done using stop_machine(). That is
> > > not ideal -- text_poke_stop_machine() was replaced with INT3+emulation
> > > via text_poke_bp(), but I'm using this to address two issues:
> > >   1) emulation in text_poke() can only easily handle a small set
> > >   of instructions and this is problematic for inlined pv-ops (and see
> > >   a possible alternatives use-case below.)
> > >   2) paravirt patching might have inter-dependendent ops (ex.
> > >   lock.queued_lock_slowpath, lock.queued_lock_unlock are paired and
> > >   need to be updated atomically.)
> > =

> > And then you hope that the spinlock state transfers.. That is that both
> > implementations agree what an unlocked spinlock looks like.
> > =

> > Suppose the native one was a ticket spinlock, where unlocked means 'head
> > =3D=3D tail' while the paravirt one is a test-and-set spinlock, where
> > unlocked means 'val =3D=3D 0'.
> > =

> > That just happens to not be the case now, but it was for a fair while.
> =

> Sure? This would mean that before spinlock-pvops are being set no lock
> is allowed to be used in the kernel, because this would block the boot
> time transition of the lock variant to use.

Hurm.. true. I suppose I completely forgot how paravirt spinlocks looked
before it got rewritten.

> Another problem I'm seeing is that runtime pvops patching would rely on
> the fact that stop_machine() isn't guarded by a spinlock.

It can't be, stop_machine() relies on scheduling. But yes, that another
variation of 'stuff uses spinlocks'.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

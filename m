Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031E159241
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 15:51:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20308875BC;
	Tue, 11 Feb 2020 14:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4FqlYaLtQ3X; Tue, 11 Feb 2020 14:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FDF5877E1;
	Tue, 11 Feb 2020 14:50:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEA8AC1D8E;
	Tue, 11 Feb 2020 14:50:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E7ADC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 15D2286489
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7lw3eXEU6Rce
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:50:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 28CF286429
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qWnHe7FrDz9eGFNLgL+pqzJ1ZkJDW34fv36AbfxXMr8=; b=cY+vxpu+iRqOion51hgN8KX8MM
 1ztoOSVH+loxUd+9cbzHUqhSuxSF3LOfJv8duUXhxKH2Z1IHwKMBH/at+c/Cr80ky3sxlR8qCQGvU
 aVr63GLxbE7ign3Eo81P5zChu8DcE0DuXWqtrdUZzLUQ6fsI5sw8gFrovEGfgeXMmH96vtXSW4wfO
 u3TY0WQCVUDMYijkbo0rt/loz5YVkvXyit/W4w49yjooJCHdaGaBY+7tkvMXitWtLnxCLfJi5reXz
 /knDm8dNgLTOgNnS5d+atTm7sAaC7tWVOA+UV4/lKoCh28QH0WVTf2P1CeSseDiFdoJg0jFZcRFC0
 XIvV5OOg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Wra-00065I-Nz; Tue, 11 Feb 2020 14:50:10 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EE03C300446;
 Tue, 11 Feb 2020 15:48:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B1B3D2B8BECD3; Tue, 11 Feb 2020 15:50:08 +0100 (CET)
Date: Tue, 11 Feb 2020 15:50:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [RFC PATCH 00/62] Linux as SEV-ES Guest Support
Message-ID: <20200211145008.GT14914@hirez.programming.kicks-ass.net>
References: <20200211135256.24617-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211135256.24617-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Andy Lutomirski <luto@kernel.org>, hpa@zytor.com,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Tue, Feb 11, 2020 at 02:51:54PM +0100, Joerg Roedel wrote:
> NMI Special Handling
> --------------------
> 
> The last thing that needs special handling with SEV-ES are NMIs.
> Hypervisors usually start to intercept IRET instructions when an NMI got
> injected to find out when the NMI window is re-opened. But handling IRET
> intercepts requires the hypervisor to access guest register state and is
> not possible with SEV-ES. The specification under [1] solves this
> problem with an NMI_COMPLETE message sent my the guest to the
> hypervisor, upon which the hypervisor re-opens the NMI window for the
> guest.
> 
> This patch-set sends the NMI_COMPLETE message before the actual IRET,
> while the kernel is still on a valid stack and kernel cr3. This opens
> the NMI-window a few instructions early, but this is fine as under
> x86-64 Linux NMI-nesting is safe. The alternative would be to
> single-step over the IRET, but that requires more intrusive changes to
> the entry code because it does not handle entries from kernel-mode while
> on the entry stack.
> 
> Besides the special handling above the patch-set contains the handlers
> for the #VC exception and all the exit-codes specified in [1].

Oh gawd; so instead of improving the whole NMI situation, AMD went and
made it worse still ?!?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 366141F75E6
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 11:25:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DBEA187C9F;
	Fri, 12 Jun 2020 09:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqUGIBHIiXU7; Fri, 12 Jun 2020 09:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4FB0787C9D;
	Fri, 12 Jun 2020 09:25:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2061FC016F;
	Fri, 12 Jun 2020 09:25:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A13FC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 11CCA87C9D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMMvSEeX7YLn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:25:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F56987C93
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 09:25:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1052E3AA; Fri, 12 Jun 2020 11:25:50 +0200 (CEST)
Date: Fri, 12 Jun 2020 11:25:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 59/75] x86/sev-es: Handle MONITOR/MONITORX Events
Message-ID: <20200612092549.GB3701@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-60-joro@8bytes.org>
 <20200520063845.GC17090@linux.intel.com>
 <20200611131045.GE11924@8bytes.org>
 <20200611171305.GJ29918@linux.intel.com>
 <eac2d02f-951c-16d4-d4f7-55357e790bcd@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eac2d02f-951c-16d4-d4f7-55357e790bcd@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Thu, Jun 11, 2020 at 02:33:12PM -0500, Tom Lendacky wrote:
> I don't think there is any guarantee that MONITOR/MWAIT would work within a
> guest (I'd have to dig some more on that to get a definitive answer, but
> probably not necessary to do). As you say, if KVM emulates it as a NOP,
> there's no sense in exposing the GPA - make it a NOP in the handler. I just
> need to poke some other hypervisor vendors and hear what they have to say.

Okay, makes sense. I made monitor/mwait nops in the patch-set.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

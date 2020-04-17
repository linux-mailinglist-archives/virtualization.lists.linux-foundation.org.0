Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE451ADE83
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 15:40:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDFBE863A1;
	Fri, 17 Apr 2020 13:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDVv4Quns8_a; Fri, 17 Apr 2020 13:40:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8E44586366;
	Fri, 17 Apr 2020 13:40:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74C75C0172;
	Fri, 17 Apr 2020 13:40:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF3E6C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 13:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D30A220364
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 13:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxZ-oGqossjy
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 13:40:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F71420031
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 13:40:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 01A40342; Fri, 17 Apr 2020 15:40:02 +0200 (CEST)
Date: Fri, 17 Apr 2020 15:39:59 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 05/70] x86/insn: Make inat-tables.c suitable for
 pre-decompression code
Message-ID: <20200417133959.GE21900@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-6-joro@8bytes.org>
 <20200325153945.GD27261@zn.tnic>
 <20200327120232.c8e455ca100dc0d96e4ddc43@kernel.org>
 <20200416152406.GB4290@8bytes.org>
 <20200417215000.47141001f80005f41153d22e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417215000.47141001f80005f41153d22e@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, hpa@zytor.com,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Jiri Slaby <jslaby@suse.cz>
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

On Fri, Apr 17, 2020 at 09:50:00PM +0900, Masami Hiramatsu wrote:
> On Thu, 16 Apr 2020 17:24:06 +0200
> Joerg Roedel <joro@8bytes.org> wrote:

> Ah, I got it. So you intended to port the instruction decoder to
> pre-decompression boot code, correct?

Right, it is needed there to decode instructions which cause #VC
exceptions when running as an SEV-ES guest.

> > The call-site is added with the patch that includes the
> > instruction decoder into the pre-decompression code. If possible I'd
> > like to keep those things separate, as both patches are already pretty
> > big by themselfes (and they do different things, in different parts of
> > the code).
> 
> OK, if you will send v2, please CC both to me.

Will do, I added you to the cc-list for future posts of this series.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D21ED344
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 17:24:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B6D288402;
	Wed,  3 Jun 2020 15:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MVWiuym1R6w; Wed,  3 Jun 2020 15:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1D57883B6;
	Wed,  3 Jun 2020 15:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D19BAC016E;
	Wed,  3 Jun 2020 15:24:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4A4CC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A6EDB21FAC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNW6m6j3gz+E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:24:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 1B19D203A3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 15:24:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A9A2028B; Wed,  3 Jun 2020 17:24:37 +0200 (CEST)
Date: Wed, 3 Jun 2020 17:24:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 38/75] x86/sev-es: Add SEV-ES Feature Detection
Message-ID: <20200603152436.GA17841@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-39-joro@8bytes.org>
 <20200520083916.GB1457@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520083916.GB1457@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
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

On Wed, May 20, 2020 at 10:39:16AM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:48PM +0200, Joerg Roedel wrote:
> > +bool sev_es_active(void)
> > +{
> > +	return !!(sev_status & MSR_AMD64_SEV_ES_ENABLED);
> > +}
> > +EXPORT_SYMBOL_GPL(sev_es_active);
> 
> I don't see this being used in modules anywhere in the patchset. Or am I
> missing something?

It is used in several places, for example do do_nmi() to conditionally
re-open the NMI window in SEV-ES guests. But there are other uses too,
like int sev_es_efi_map_ghcbs() or in sev_es_init_vc_handling() to opt
out if not running as an SEV-ES guest.


	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

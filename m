Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CD91D0027
	for <lists.virtualization@lfdr.de>; Tue, 12 May 2020 23:08:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 947A388656;
	Tue, 12 May 2020 21:08:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LvL3qIV7z83T; Tue, 12 May 2020 21:08:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27B1A88681;
	Tue, 12 May 2020 21:08:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFD94C016F;
	Tue, 12 May 2020 21:08:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA67FC088A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 98B5C87390
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PixgJn4KO23B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 21:08:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 854E68738B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 21:08:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7EB6CB02C;
 Tue, 12 May 2020 21:08:19 +0000 (UTC)
Date: Tue, 12 May 2020 23:08:12 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 23/75] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
Message-ID: <20200512210812.GF8135@suse.de>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-24-joro@8bytes.org>
 <20200512181157.GD6859@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512181157.GD6859@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

On Tue, May 12, 2020 at 08:11:57PM +0200, Borislav Petkov wrote:
> > +# sev-es.c inludes generated $(objtree)/arch/x86/lib/inat-tables.c
> 
> 	      "includes"
> 
> > +CFLAGS_sev-es.o += -I$(objtree)/arch/x86/lib/
> 
> Does it?
> 
> I see
> 
> #include "../../lib/inat.c"
> #include "../../lib/insn.c"
> 
> only and with the above CFLAGS-line removed, it builds still.
> 
> Leftover from earlier?

No, this is a recent addition, otherwise this breaks out-of-tree builds
(make O=/some/path ...) because inat-tables.c (included from inat.c) is
generated during build and ends up in the $(objtree).

> > +	insn_init(&ctxt->insn, buffer, MAX_INSN_SIZE, 1);
> > +	insn_get_length(&ctxt->insn);
> > +
> > +	ret = ctxt->insn.immediate.got ? ES_OK : ES_DECODE_FAILED;
> 
> Why are we checking whether the immediate? insn_get_length() sets
> insn->length unconditionally while insn_get_immediate() can error out
> and not set ->got... ?

Because the immediate is the last part of the instruction which is
decoded (even if there is no immediate). The .got field is set when
either the immediate was decoded successfully or, in case the
instruction has no immediate, when the rest of the instruction was
decoded successfully. So testing immediate.got is the indicator whether
decoding was successful.

> 
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +static bool sev_es_setup_ghcb(void)
> > +{
> > +	if (!sev_es_negotiate_protocol())
> > +		sev_es_terminate(GHCB_SEV_ES_REASON_PROTOCOL_UNSUPPORTED);
> > +
> > +	if (set_page_decrypted((unsigned long)&boot_ghcb_page))
> > +		return false;
> > +
> > +	/* Page is now mapped decrypted, clear it */
> > +	memset(&boot_ghcb_page, 0, sizeof(boot_ghcb_page));
> > +
> > +	boot_ghcb = &boot_ghcb_page;
> > +
> > +	/* Initialize lookup tables for the instruction decoder */
> > +	inat_init_tables();
> 
> Yeah, that call doesn't logically belong in this function AFAICT as this
> function should setup the GHCB only. You can move it to the caller.

Probably better rename the function, it also does the sev-es protocol
version negotiation and all other related setup tasks. Maybe
sev_es_setup() is a better name?

> > +	if (set_page_encrypted((unsigned long)&boot_ghcb_page))
> > +		error("Can't map GHCB page encrypted");
> 
> Is that error() call enough?
> 
> Shouldn't we BUG_ON() here or mark that page Reserved or so, so that
> nothing uses it during the system lifetime and thus avoid the strange
> cache effects?

If the above call fails its the end of the systems lifetime, because we
can't continue to boot an SEV-ES guest when we have no GHCB.

BUG_ON() and friends are also not available in the pre-decompression
boot stage.

> 
> ...
> 
> > +static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
> > +					  struct es_em_ctxt *ctxt,
> > +					  u64 exit_code, u64 exit_info_1,
> > +					  u64 exit_info_2)
> > +{
> > +	enum es_result ret;
> > +
> > +	/* Fill in protocol and format specifiers */
> > +	ghcb->protocol_version = GHCB_PROTOCOL_MAX;
> > +	ghcb->ghcb_usage       = GHCB_DEFAULT_USAGE;
> > +
> > +	ghcb_set_sw_exit_code(ghcb, exit_code);
> > +	ghcb_set_sw_exit_info_1(ghcb, exit_info_1);
> > +	ghcb_set_sw_exit_info_2(ghcb, exit_info_2);
> > +
> > +	sev_es_wr_ghcb_msr(__pa(ghcb));
> > +	VMGEXIT();
> > +
> > +	if ((ghcb->save.sw_exit_info_1 & 0xffffffff) == 1) {
> 					^^^^^^^^^^^
> 
> (1UL << 32) - 1
> 
> I guess.

Or lower_32_bits(), probably. I'll change it.

Thanks,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

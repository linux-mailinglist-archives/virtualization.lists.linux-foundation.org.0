Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F241ACA17
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 17:31:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A40DC87FD2;
	Thu, 16 Apr 2020 15:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuMMIK1bDCS0; Thu, 16 Apr 2020 15:24:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8F3987FC3;
	Thu, 16 Apr 2020 15:24:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96D8AC0172;
	Thu, 16 Apr 2020 15:24:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65DE1C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5B7CF872E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoRw4E3926nj
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:24:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A9E7486F9F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:24:10 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 28B6F2B0; Thu, 16 Apr 2020 17:24:08 +0200 (CEST)
Date: Thu, 16 Apr 2020 17:24:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH 05/70] x86/insn: Make inat-tables.c suitable for
 pre-decompression code
Message-ID: <20200416152406.GB4290@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-6-joro@8bytes.org>
 <20200325153945.GD27261@zn.tnic>
 <20200327120232.c8e455ca100dc0d96e4ddc43@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327120232.c8e455ca100dc0d96e4ddc43@kernel.org>
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

Hi Masami,

On Fri, Mar 27, 2020 at 12:02:32PM +0900, Masami Hiramatsu wrote:
> On Wed, 25 Mar 2020 16:39:45 +0100
> Borislav Petkov <bp@alien8.de> wrote:
> 
> > + Masami.
> > 
> > On Thu, Mar 19, 2020 at 10:13:02AM +0100, Joerg Roedel wrote:
> > > From: Joerg Roedel <jroedel@suse.de>
> > > 
> > > The inat-tables.c file has some arrays in it that contain pointers to
> > > other arrays. These pointers need to be relocated when the kernel
> > > image is moved to a different location.
> > > 
> > > The pre-decompression boot-code has no support for applying ELF
> > > relocations, so initialize these arrays at runtime in the
> > > pre-decompression code to make sure all pointers are correctly
> > > initialized.
> 
> I need to check the whole series, but as far as I can understand from
> this patch, this seems not allowing to store the address value in
> static pointers. It may break more things, for example _kprobe_blacklist
> records the NOKPROBE_SYMBOL() symbol addresses at the build time.

The runtime-initialization function is only used in the
pre-decompression boot code (arch/x86/boot/compressed/) which is not
part of the running kernel image. At that stage of booting there is no
support for kprobe or tracing or any other neat features that might
break things here.


> > > +	print "#ifndef __BOOT_COMPRESSED\n"
> > > +
> > >  	# print escape opcode map's array
> > >  	print "/* Escape opcode map array */"
> > >  	print "const insn_attr_t * const inat_escape_tables[INAT_ESC_MAX + 1]" \
> > > @@ -388,6 +391,51 @@ END {
> > >  		for (j = 0; j < max_lprefix; j++)
> > >  			if (atable[i,j])
> > >  				print "	["i"]["j"] = "atable[i,j]","
> > > -	print "};"
> > > +	print "};\n"
> > > +
> > > +	print "#else /* !__BOOT_COMPRESSED */\n"
> 
> I think the definitions of inat_*_tables can be shared in both case.
> If __BOOT_COMPRESSED is set, we can define inat_init_tables() as a
> initialize function, and if not, it will be just a dummy "do {} while (0)".

The inat_*_tables are all declared const, so this way it is not possible
to change them at runtime. For the running kernel image this is fine, as
there are ELF relocations which fix things up, but at the
pre-decompression boot stage there are no ELF relocations which can fix
the tables, so the pointers in there need to be initialized at runtime.

> BTW, where is the __BOOT_COMPRESSED defined?

It is defined in arch/x86/boot/compressed/sev-es.c by patch

	x86/boot/compressed/64: Setup GHCB Based VC Exception handler

which also includes parts of the instruction decoder into the
pre-decompression boot code and adds the only call-site for
inat_init_tables().

> > > +	print "static void inat_init_tables(void)"
> 
> This functions should be "inline".
> And I can not see the call-site of inat_init_tables() in this patch.

The call-site is added with the patch that includes the
instruction decoder into the pre-decompression code. If possible I'd
like to keep those things separate, as both patches are already pretty
big by themselfes (and they do different things, in different parts of
the code).

> If possible, please include call-site with definition (especially
> new init function) so that I can check the init call timing too.

The function is called at the first #VC exception after a GHCB has been
set up. Call-path is: boot_vc_handler -> sev_es_setup_ghcb ->
inat_init_tables.

See

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/tree/arch/x86/boot/compressed/sev-es.c?h=sev-es-client-v5.6-rc6

for the full code there.

Thanks,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

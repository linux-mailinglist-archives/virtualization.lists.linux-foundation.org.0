Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 912D91ECD33
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 12:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3D15B20444;
	Wed,  3 Jun 2020 10:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZjfmAJPC61Ji; Wed,  3 Jun 2020 10:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 58C1022855;
	Wed,  3 Jun 2020 10:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26B26C016E;
	Wed,  3 Jun 2020 10:09:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9313C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DEAA186B6D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cgets_hz_Fwv
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:09:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A9420850E6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:09:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4CD7E28B; Wed,  3 Jun 2020 12:08:59 +0200 (CEST)
Date: Wed, 3 Jun 2020 12:08:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 23/75] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
Message-ID: <20200603100857.GA20099@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-24-joro@8bytes.org>
 <20200511200709.GE25861@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511200709.GE25861@zn.tnic>
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

On Mon, May 11, 2020 at 10:07:09PM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:33PM +0200, Joerg Roedel wrote:
> > @@ -63,3 +175,45 @@ void __init do_vc_no_ghcb(struct pt_regs *regs, unsigned long exit_code)
> >  	while (true)
> >  		asm volatile("hlt\n");
> >  }
> > +
> > +static enum es_result vc_insn_string_read(struct es_em_ctxt *ctxt,
> > +					  void *src, char *buf,
> > +					  unsigned int data_size,
> > +					  unsigned int count,
> > +					  bool backwards)
> > +{
> > +	int i, b = backwards ? -1 : 1;
> > +	enum es_result ret = ES_OK;
> > +
> > +	for (i = 0; i < count; i++) {
> > +		void *s = src + (i * data_size * b);
> > +		char *d = buf + (i * data_size);
> 
> >From a previous review:
> 
> Where are we checking whether that count is not exceeding @buf or
> similar discrepancies?

These two functions are only called from vc_handle_ioio() and buf always
points to ghcb->shared_buffer.

In general, the caller has to make sure that sizeof(*buf) is at least
data_size*count, and handle_ioio() calculates count based on the size of
*buf.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

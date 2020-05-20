Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE241DAE73
	for <lists.virtualization@lfdr.de>; Wed, 20 May 2020 11:14:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E3C08723E;
	Wed, 20 May 2020 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L59uSrc56Ooa; Wed, 20 May 2020 09:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0C2186FFF;
	Wed, 20 May 2020 09:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97A63C0176;
	Wed, 20 May 2020 09:14:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C34DC0176
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5471C232F2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 09:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvbAM-vhl65m
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 09:14:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id 48B6D22767
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 09:14:24 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0bab00d907527c3c1e360d.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:ab00:d907:527c:3c1e:360d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 47C811EC032C;
 Wed, 20 May 2020 11:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1589966062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=LiDZJ/nDDOx6HNQyMN6etFUDBDZ4zUzKnqjvmtstft0=;
 b=NAfDGZuYM1NLD2lCZ1oQZIZ7UGOSHsSZ0Zu/lgomzdOS6sf36E9Rj79WbRNcWpl86KpX+L
 zvCKYyoH/HH8DbtCZKcEsv40un5TfHc0NyTxCuLOPjo0ovPggkKuqcLUUbHTcKokbQ/mS0
 o0l9nWvwsPxoFmCz1B3jcXZp80MWqlM=
Date: Wed, 20 May 2020 11:14:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 40/75] x86/sev-es: Compile early handler code into
 kernel image
Message-ID: <20200520091415.GC1457@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-41-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-41-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Tue, Apr 28, 2020 at 05:16:50PM +0200, Joerg Roedel wrote:
> +static inline u64 sev_es_rd_ghcb_msr(void)
> +{
> +	return native_read_msr(MSR_AMD64_SEV_ES_GHCB);
> +}
> +
> +static inline void sev_es_wr_ghcb_msr(u64 val)
> +{
> +	u32 low, high;
> +
> +	low  = (u32)(val);
> +	high = (u32)(val >> 32);
> +
> +	native_write_msr(MSR_AMD64_SEV_ES_GHCB, low, high);
> +}

Instead of duplicating those two, you can lift the ones in the
compressed image into sev-es.h and use them here. I don't care one bit
about the MSR tracepoints in native_*_msr().

> +static enum es_result vc_write_mem(struct es_em_ctxt *ctxt,
> +				   char *dst, char *buf, size_t size)
> +{
> +	unsigned long error_code = X86_PF_PROT | X86_PF_WRITE;
> +	char __user *target = (char __user *)dst;
> +	u64 d8;
> +	u32 d4;
> +	u16 d2;
> +	u8  d1;
> +
> +	switch (size) {
> +	case 1:
> +		memcpy(&d1, buf, 1);
> +		if (put_user(d1, target))
> +			goto fault;
> +		break;
> +	case 2:
> +		memcpy(&d2, buf, 2);
> +		if (put_user(d2, target))
> +			goto fault;
> +		break;
> +	case 4:
> +		memcpy(&d4, buf, 4);
> +		if (put_user(d4, target))
> +			goto fault;
> +		break;
> +	case 8:
> +		memcpy(&d8, buf, 8);
> +		if (put_user(d8, target))
> +			goto fault;

Ok, those (and below) memcpys get nicely optimized to MOVs by the
compiler here.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B21DE1EE
	for <lists.virtualization@lfdr.de>; Fri, 22 May 2020 10:33:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB07B888D3;
	Fri, 22 May 2020 08:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bH98TzpldPtL; Fri, 22 May 2020 08:33:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 47782888C7;
	Fri, 22 May 2020 08:33:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21359C0176;
	Fri, 22 May 2020 08:33:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BB2CC0176
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 08:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00C7E87746
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 08:33:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x0Rp1ZjC51iA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 08:33:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 87BB287742
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 May 2020 08:33:34 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0d4900b115cc0add6835a7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0d:4900:b115:cc0a:dd68:35a7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AA2481EC02B3;
 Fri, 22 May 2020 10:33:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590136411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=MWGiXlMNmCUQrdL2VMbcT6Bsa2l19TPcZCK5SYOHTQo=;
 b=O9AFrS5SFc4FVW5LZq+2OvQsE8crvfBABJ6KpFEy5z3reuvsHKsaxuPdeTSNV1SR9Tpc8K
 8JMk0rMt3O+4UuTn07lpAK8mVm4KNWW57XrXVQNzFsFoxwcCmjNHfhZCOrBpkQWXNqQWHb
 DOaEnO50y9eDEQvBB3+TP2+26IxN5AM=
Date: Fri, 22 May 2020 10:33:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 43/75] x86/sev-es: Setup per-cpu GHCBs for the runtime
 handler
Message-ID: <20200522083321.GA28750@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-44-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-44-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:16:53PM +0200, Joerg Roedel wrote:
> @@ -198,6 +210,48 @@ static bool __init sev_es_setup_ghcb(void)
>  	return true;
>  }
>  
> +static void __init sev_es_alloc_runtime_data(int cpu)
> +{
> +	struct sev_es_runtime_data *data;
> +
> +	data = memblock_alloc(sizeof(*data), PAGE_SIZE);
> +	if (!data)
> +		panic("Can't allocate SEV-ES runtime data");
> +
> +	per_cpu(runtime_data, cpu) = data;
> +}
> +
> +static void __init sev_es_init_ghcb(int cpu)

Since those are static functions, I'd drop the "sev_es_" prefix from the
name for better readability. Because otherwise the whole file is a sea
of "sev_es_"-prefixed identifiers which you need to read until the end
to know what they are.

> +{
> +	struct sev_es_runtime_data *data;
> +	int err;
> +
> +	data = per_cpu(runtime_data, cpu);
> +
> +	err = early_set_memory_decrypted((unsigned long)&data->ghcb_page,
> +					 sizeof(data->ghcb_page));
> +	if (err)
> +		panic("Can not map GHCBs unencrypted");

			"Error mapping ..."

> +
> +	memset(&data->ghcb_page, 0, sizeof(data->ghcb_page));
> +}

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

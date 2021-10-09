Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA442795C
	for <lists.virtualization@lfdr.de>; Sat,  9 Oct 2021 13:04:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D35B240569;
	Sat,  9 Oct 2021 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7mI6htsxPtj; Sat,  9 Oct 2021 11:04:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DB75140534;
	Sat,  9 Oct 2021 11:04:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55B5FC000D;
	Sat,  9 Oct 2021 11:04:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9E22C000D
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2D96069F
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0wMlcAeYKYx
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:04:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C604C605F4
 for <virtualization@lists.linux-foundation.org>;
 Sat,  9 Oct 2021 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633777464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJ/2iCuZIJi8M6YSq3TSpepZV4prmg5N+D8TG37hfos=;
 b=ArtvM8Nk242373TmJz/scmMFbPFmQ1GUmi52+U9dfWIjd41wnl5rCL4O1Qrwp9cCXpne8V
 GKPNZ/EXKtEydEYAwiXGyI6QbOLKvBDM99zJJuOmWex3DHE6mVyd1yOm5fxk1Rm9snMxC/
 EW47tNxx3hQnIO/dMEbJw2w9NEawTOc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-3bWGpMkLNk6nSit7DSl_zQ-1; Sat, 09 Oct 2021 07:04:22 -0400
X-MC-Unique: 3bWGpMkLNk6nSit7DSl_zQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v9-20020a50d849000000b003db459aa3f5so8898765edj.15
 for <virtualization@lists.linux-foundation.org>;
 Sat, 09 Oct 2021 04:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lJ/2iCuZIJi8M6YSq3TSpepZV4prmg5N+D8TG37hfos=;
 b=UN9fBnxyqvGxsHBGiULOJ92ppzz8HSj/nn1FsEz1VZzNqBIbnsxIXOqfmCz76hAip2
 obxHxZs5e7N5tdjwEIB1QS3dqmxvlmH4RccfRMiSF2z719hWe05JluScpnyS30ovRyYa
 14YocdurhZGntrGQsxNjuPy6XdAa0ZjBmUO/wsjAo7D1C2b5nly57egH1OoHuhqajwC8
 5oxw7A1YSYb2LMI4OE99qdQacPpPNic0Ksv2qbRCohfCxxHfj4HA75tm5pqKdQfMADx7
 BahsE49ib8AtbZdICIBdABnUqIK4cASuUBirjouzwSxpa35bwyLLRR0IsEwdKscT538J
 0SzA==
X-Gm-Message-State: AOAM531aS7xr9qu8cl/iDI9Lw8803aCcgbfx4dIeVnNc88f8uCmaeXxZ
 njX8eCxrWoTMTvDegN+/B2I7gtMiowZtPMjS9/OyOT8pqHit+XTxExzD871l4RiHj8Y0Ney3G0O
 09H660VR7vKfYhBFXbUScfZo0Z/OnlegJQTqLxtB8jQ==
X-Received: by 2002:a17:906:585a:: with SMTP id
 h26mr10966039ejs.31.1633777461691; 
 Sat, 09 Oct 2021 04:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwobA8ZxtLfM+i96qTUZJc2D6zqI9p4pA768qS/bvwYQXY5otl6Kxnqg/w4gwu0W8PjfTgg/g==
X-Received: by 2002:a17:906:585a:: with SMTP id
 h26mr10965985ejs.31.1633777461334; 
 Sat, 09 Oct 2021 04:04:21 -0700 (PDT)
Received: from redhat.com ([2.55.132.170])
 by smtp.gmail.com with ESMTPSA id n22sm831106eja.120.2021.10.09.04.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 04:04:20 -0700 (PDT)
Date: Sat, 9 Oct 2021 07:04:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v5 16/16] x86/tdx: Add cmdline option to force use of
 ioremap_host_shared
Message-ID: <20211009070132-mutt-send-email-mst@kernel.org>
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211009003711.1390019-17-sathyanarayanan.kuppuswamy@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrea Arcangeli <aarcange@redhat.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>
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

On Fri, Oct 08, 2021 at 05:37:11PM -0700, Kuppuswamy Sathyanarayanan wrote:
> +	ioremap_force_shared= [X86_64, CCG]
> +			Force the kernel to use shared memory mappings which do
> +			not use ioremap_host_shared/pcimap_host_shared to opt-in
> +			to shared mappings with the host. This feature is mainly
> +			used by a confidential guest when enabling new drivers
> +			without proper shared memory related changes. Please note
> +			that this option might also allow other non explicitly
> +			enabled drivers to interact with the host in confidential
> +			guest, which could cause other security risks. This option
> +			will also cause BIOS data structures to be shared with the
> +			host, which might open security holes.
> +
>  	io7=		[HW] IO7 for Marvel-based Alpha systems
>  			See comment before marvel_specify_io7 in
>  			arch/alpha/kernel/core_marvel.c.

The connection is quite unfortunate IMHO.
Can't there be an option
that unbreaks drivers *without* opening up security holes by
making BIOS shared?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

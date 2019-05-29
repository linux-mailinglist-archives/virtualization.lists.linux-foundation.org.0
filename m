Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FC2E1AC
	for <lists.virtualization@lfdr.de>; Wed, 29 May 2019 17:53:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2EF126DC;
	Wed, 29 May 2019 15:53:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E21E72530
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 15:48:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8B3C7619
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 15:48:46 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n5so2242660ioc.7
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 08:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cDz3GbUaoai6r6zW2MM2kvL6r+fuZogzUR81Y2LegRo=;
	b=HM+aD2WHWHXPATtRijrlE6pgyLNsdvu63KgjTL49oFkMJudqlZoYZ8f09bSgUZ00cM
	UBIFA2ig49PRFgbWTBqlRg0bT4x6o99kGSMBxaueQLiX9/in0ivbgL6eobEw5dh+VFne
	V8Y49LUYOrhunDFrh+PrlG1sdaO5FkdZgju4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cDz3GbUaoai6r6zW2MM2kvL6r+fuZogzUR81Y2LegRo=;
	b=XeDoYDXvSVfPIODSGZ6n0MKtbwkZgNvnD528TYQrJRn4ZKenIYDDlmO6g3h7zT8Qq0
	2mrmCxSR/hF4mY1so2i+r92OAtPadWbOHLgcSNtqJZxtogdWjgdTeCPrfPCjI8wmugSY
	yVBmoDLStE2KDwKWZizMPNoyYKGqFNDOntCGZQnaleiimdjdU7NIv3BZlsRnQFihWvNe
	P3uwlKujUuy2jiUKFw7QmkvH6L8FRHGjjNA/U/jknRHHHihNXTYs97XKlbS3sp/fwBck
	gZW6yLmegBrLg0Iafx6O+jSALQ9fs4bPjmPTH4IN5qARclwl6W1SBJd15OttK/nBmP0Z
	k4VQ==
X-Gm-Message-State: APjAAAVP0K23JOFaYLbpIvSN5VJwf7WSmeMQQC/gQZvkN8huDAyCHr9o
	q8j7unKyiw81y5aU/85X2c33n1kR5HA=
X-Google-Smtp-Source: APXvYqzUid9847SjMmF3qNzHIfOa6sfb+maek/EWb2+d+Q2WrhpXuDZa55kgDWmHaFmKhDCEHOkzEw==
X-Received: by 2002:a05:6602:2256:: with SMTP id
	o22mr6374971ioo.95.1559144924895; 
	Wed, 29 May 2019 08:48:44 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
	[209.85.166.43]) by smtp.gmail.com with ESMTPSA id
	m10sm1114199iti.24.2019.05.29.08.48.43
	for <virtualization@lists.linux-foundation.org>
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 08:48:43 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id p2so2265654iol.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 29 May 2019 08:48:43 -0700 (PDT)
X-Received: by 2002:a5d:9d90:: with SMTP id 16mr6500257ion.132.1559144923364; 
	Wed, 29 May 2019 08:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190520231948.49693-1-thgarnie@chromium.org>
	<20190520231948.49693-12-thgarnie@chromium.org>
	<1b53b8eb-5dd3-fb57-d8db-06eedd0ce49f@suse.com>
In-Reply-To: <1b53b8eb-5dd3-fb57-d8db-06eedd0ce49f@suse.com>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Wed, 29 May 2019 08:48:32 -0700
X-Gmail-Original-Message-ID: <CAJcbSZF1xcMpLDrOLkh493+ciVUqrku9WkWdb5xxAqWuXMjGZw@mail.gmail.com>
Message-ID: <CAJcbSZF1xcMpLDrOLkh493+ciVUqrku9WkWdb5xxAqWuXMjGZw@mail.gmail.com>
Subject: Re: [PATCH v7 11/12] x86/paravirt: Adapt assembly for PIE support
To: Juergen Gross <jgross@suse.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Alok Kataria <akataria@vmware.com>,
	Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Sun, May 26, 2019 at 10:47 PM Juergen Gross <jgross@suse.com> wrote:
>
> On 21/05/2019 01:19, Thomas Garnier wrote:
> > From: Thomas Garnier <thgarnie@google.com>
> >
> > if PIE is enabled, switch the paravirt assembly constraints to be
> > compatible. The %c/i constrains generate smaller code so is kept by
> > default.
> >
> > Position Independent Executable (PIE) support will allow to extend the
> > KASLR randomization range below 0xffffffff80000000.
> >
> > Signed-off-by: Thomas Garnier <thgarnie@google.com>
>
> Acked-by: Juergen Gross <jgross@suse.com>

Thanks Juergen.

>
>
> Juergen
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

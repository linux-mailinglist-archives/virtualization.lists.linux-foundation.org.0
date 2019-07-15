Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2FD69113
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 16:26:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B167FF0C;
	Mon, 15 Jul 2019 14:26:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13115EE6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CDD01876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:26:38 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 63AB921850
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 14:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563200798;
	bh=DNqlzREK4dV/aPzROroMGAgiODE6UVu/9+MH9locEQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SabY96C/POfFbxV/Umsy2WGXdijJG7KF8f3Ysqqdifd7WqBbEJx+xG8P7Mmx5WDBz
	q3jA6uUizcJUa+q10TuC7UrMWVr4NRyvH6PaW3VSAzRFj033Puah609iqGVB5ULYFh
	WWDH1OLKrjzSjdlcJvmRoz/+0x0+44lupFxtDxGM=
Received: by mail-wr1-f42.google.com with SMTP id x1so2329958wrr.9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 07:26:38 -0700 (PDT)
X-Gm-Message-State: APjAAAXRYgJ01uDpMgznd6ra3AmZ2yJxc4DydLPT9I27RwoFONBcDGCE
	e+gDgU9kxUtLnBoNnvHvSbbd6utmvuTKAM/59vS/tw==
X-Google-Smtp-Source: APXvYqww0AN3+Pb54VR+Bz/+6fgGsdMSZEJs1XScvHSY8TTgNMqkXTS8y1miAw5Idq1Dc5EeFC1Tkcu7M/Wx0leEMSw=
X-Received: by 2002:adf:dd0f:: with SMTP id a15mr27817870wrm.265.1563200796986;
	Mon, 15 Jul 2019 07:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190715130056.10627-1-andrew.cooper3@citrix.com>
	<a04918d1-975e-5869-1ecd-c9df4ae5b1c1@suse.com>
In-Reply-To: <a04918d1-975e-5869-1ecd-c9df4ae5b1c1@suse.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 15 Jul 2019 07:26:25 -0700
X-Gmail-Original-Message-ID: <CALCETrX0T=vzyN8gqoBmA72xwzS45d5bDTfcZQJayht9n9ijPA@mail.gmail.com>
Message-ID: <CALCETrX0T=vzyN8gqoBmA72xwzS45d5bDTfcZQJayht9n9ijPA@mail.gmail.com>
Subject: Re: [PATCH] x86/paravirt: Drop {read,write}_cr8() hooks
To: Juergen Gross <jgross@suse.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: FengTang <feng.tang@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	X86 ML <x86@kernel.org>, "Rafael J.Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>, Stephane Eranian <eranian@google.com>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Nadav Amit <namit@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Alok Kataria <akataria@vmware.com>
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

On Mon, Jul 15, 2019 at 6:23 AM Juergen Gross <jgross@suse.com> wrote:
>
> On 15.07.19 15:00, Andrew Cooper wrote:
> > There is a lot of infrastructure for functionality which is used
> > exclusively in __{save,restore}_processor_state() on the suspend/resume
> > path.
> >
> > cr8 is an alias of APIC_TASKPRI, and APIC_TASKPRI is saved/restored
> > independently by lapic_{suspend,resume}().
>
> Aren't those called only with CONFIG_PM set?
>


Unless I'm missing something, we only build any of the restore code
(including the write_cr8() call) if CONFIG_PM_SLEEP is set, and that
selects CONFIG_PM, so we should be fine, I think.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

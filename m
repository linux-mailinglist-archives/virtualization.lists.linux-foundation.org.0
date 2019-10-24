Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E047E4071
	for <lists.virtualization@lfdr.de>; Fri, 25 Oct 2019 01:59:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AAF09D82;
	Thu, 24 Oct 2019 23:59:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B418D3E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 23:59:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CD2D0831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 23:59:08 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
	[73.231.172.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0D04A21BE5;
	Thu, 24 Oct 2019 23:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571961548;
	bh=a/612v51V67JQto4Q9B5ZAq4SDuSUffERC3MjVZlvzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FLKyYhRTbZ+/+IsLcbdEP5BKSXEhbWMmIVlLS9FtMbHpRTEcfHgQeEPyhskQ1t1CU
	xncLjQCMgcgw92AAmidj76BEJIazepTQm+zp6MZzE8V4iXprTMLgEjFOJjahfRZWGD
	bm9roxJxzS9yzjC8jMbJtKm4MnaSA47vUui31rco=
Date: Thu, 24 Oct 2019 16:59:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v2 0/3] kcov: collect coverage from usb and vhost
Message-Id: <20191024165907.d56f8050b5097639263c0a41@linux-foundation.org>
In-Reply-To: <CAAeHK+xLS8TVioJeqYrf9Kso9TsiWiH0O-k+RrRBCKPPS9_Hrg@mail.gmail.com>
References: <cover.1571844200.git.andreyknvl@google.com>
	<20191023150413.8aa05549bd840deccfed5539@linux-foundation.org>
	<CAAeHK+xLS8TVioJeqYrf9Kso9TsiWiH0O-k+RrRBCKPPS9_Hrg@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marco Elver <elver@google.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, KVM list <kvm@vger.kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev <netdev@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Windsor <dwindsor@gmail.com>
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

On Thu, 24 Oct 2019 14:47:31 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:

> > is it expected that the new kcov feature will be used elsewhere in the
> > kernel?
> >
> > If the latter, which are the expected subsystems?
> 
> Currently we encountered two cases where this is useful: USB and vhost
> workers. Most probably there are more subsystems that will benefit
> from this kcov extension to get better fuzzing coverage. I don't have
> a list of them, but the provided interface should be easy to use when
> more of such cases are encountered.

It would be helpful to add such a list to the changelog.  Best-effort
and approximate is OK - just to help people understand the eventual
usefulness of the proposal.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

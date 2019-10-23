Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FEFE260F
	for <lists.virtualization@lfdr.de>; Thu, 24 Oct 2019 00:04:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AAD18BE4;
	Wed, 23 Oct 2019 22:04:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69346B8A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 22:04:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 000A08A0
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 22:04:14 +0000 (UTC)
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 475632084C;
	Wed, 23 Oct 2019 22:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571868254;
	bh=ZxZ2bjgrY8LxhC2gxwLipAEf5uWwjrnOAtpoB5RPRXI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nNtl5XCv0j9A48YnWaF5iTudfCQq33+QXJgRHWDYDg2YmEqbZCLDe+NCQQetvnR/b
	3CtLgVZL25LnwIFN+itO3rrgLffBBVQHhKExtJ614qS8GnmXP7HXLzSds5ViMnMXX/
	nrTddbLuRTbdz423kAsG34HKFcGZ+DmZP7edoe2A=
Date: Wed, 23 Oct 2019 15:04:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v2 0/3] kcov: collect coverage from usb and vhost
Message-Id: <20191023150413.8aa05549bd840deccfed5539@linux-foundation.org>
In-Reply-To: <cover.1571844200.git.andreyknvl@google.com>
References: <cover.1571844200.git.andreyknvl@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marco Elver <elver@google.com>, Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On Wed, 23 Oct 2019 17:24:28 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:

> This patchset extends kcov to allow collecting coverage from the USB
> subsystem and vhost workers. See the first patch description for details
> about the kcov extension. The other two patches apply this kcov extension
> to USB and vhost.
> 
> These patches have been used to enable coverage-guided USB fuzzing with
> syzkaller for the last few years

I find it surprising that this material is so focused on USB.  Is
there something unique about USB that gave rise to this situation, or
is it expected that the new kcov feature will be used elsewhere in the
kernel?

If the latter, which are the expected subsystems?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

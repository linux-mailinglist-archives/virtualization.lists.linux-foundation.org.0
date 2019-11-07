Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC9AF2BFA
	for <lists.virtualization@lfdr.de>; Thu,  7 Nov 2019 11:19:16 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 566A1150C;
	Thu,  7 Nov 2019 10:19:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 23E5BD8D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:19:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BE10D87D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 10:19:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 22BF42084D;
	Thu,  7 Nov 2019 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573121949;
	bh=veSNy8fHpebcc4Qmp98qkfhKdLnCD3QplNB+Rkjzb38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5HR5UtWgEVSoCewOeCOvQ+7niFoy1nWzZPd9rnyhJlit/8XKLlyRkgKP+RW4/ARv
	HU7XR8MtpDVdY6aDdGNgaMpeCijUFZ4hKWFojxo61Cf2PySQZKiJkV6iRoJgNtfzRi
	PZmi9vfl+T1Q3if4yW5hU8ym1X3VqIneyMPoJIaI=
Date: Thu, 7 Nov 2019 11:19:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v3 2/3] usb, kcov: collect coverage from hub_event
Message-ID: <20191107101907.GA1365996@kroah.com>
References: <cover.1572366574.git.andreyknvl@google.com>
	<de4fe1c219db2d002d905dc1736e2a3bfa1db997.1572366574.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de4fe1c219db2d002d905dc1736e2a3bfa1db997.1572366574.git.andreyknvl@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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

On Tue, Oct 29, 2019 at 05:32:28PM +0100, Andrey Konovalov wrote:
> This patch adds kcov_remote_start()/kcov_remote_stop() annotations to the
> hub_event() function, which is responsible for processing events on USB
> buses, in particular events that happen during USB device enumeration.
> Since hub_event() is run in a global background kernel thread (see
> Documentation/dev-tools/kcov.rst for details), each USB bus gets a unique
> global handle from the USB subsystem kcov handle range. As the result kcov
> can now be used to collect coverage from events that happen on a
> particular USB bus.
> 
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> ---
>  drivers/usb/core/hub.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9EDB83F
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 22:28:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9B200C87;
	Thu, 17 Oct 2019 20:28:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F673C3F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 20:28:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 442556C5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 20:28:44 +0000 (UTC)
Received: from localhost (unknown [104.132.0.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E4A8D20872;
	Thu, 17 Oct 2019 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571344124;
	bh=CWLsDmLmdYR77gpLL5DPedco3zJy9XUl7rfGOcX4D7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1CwFat8VN3R7UaivtiPE57Qun45r6dpf1UEOiCohaQD1A4Ut2TKeQfGQDCEahEvAN
	SCvGBotaVta0OU7UFOhOglCMG9FrzN1UStIs4YhjydLuYW09eTIuS/alJV4Nh9Kupb
	+fMXhVPfIdh08F1RU2t/R+Zooya52b6YZrH0R3Sg=
Date: Thu, 17 Oct 2019 13:28:43 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH RFC 3/3] vhost, kcov: collect coverage from vhost_worker
Message-ID: <20191017202843.GA1103978@kroah.com>
References: <cover.1571333592.git.andreyknvl@google.com>
	<af26317c0efd412dd660e81d548a173942f8a0ad.1571333592.git.andreyknvl@google.com>
	<20191017181800.GB1094415@kroah.com>
	<CAAeHK+yS24KnecLyhnPEHx-dOSk3cvVHhtGHe+9Uf2d96+ZqjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+yS24KnecLyhnPEHx-dOSk3cvVHhtGHe+9Uf2d96+ZqjQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux-foundation.org,
	Alan Stern <stern@rowland.harvard.edu>,
	Elena Reshetova <elena.reshetova@intel.com>,
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

On Thu, Oct 17, 2019 at 09:00:18PM +0200, Andrey Konovalov wrote:
> On Thu, Oct 17, 2019 at 8:18 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 17, 2019 at 07:44:15PM +0200, Andrey Konovalov wrote:
> > > This patch adds kcov_remote_start/kcov_remote_stop annotations to the
> > > vhost_worker function, which is responsible for processing vhost works.
> > > Since vhost_worker is spawned when a vhost device instance is created,
> > > the common kcov handle is used for kcov_remote_start/stop annotations.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> > >  drivers/vhost/vhost.c | 15 +++++++++++++++
> > >  drivers/vhost/vhost.h |  3 +++
> > >  2 files changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > > index 36ca2cf419bf..71a349f6b352 100644
> > > --- a/drivers/vhost/vhost.c
> > > +++ b/drivers/vhost/vhost.c
> > > @@ -357,7 +357,13 @@ static int vhost_worker(void *data)
> > >               llist_for_each_entry_safe(work, work_next, node, node) {
> > >                       clear_bit(VHOST_WORK_QUEUED, &work->flags);
> > >                       __set_current_state(TASK_RUNNING);
> > > +#ifdef CONFIG_KCOV
> > > +                     kcov_remote_start(dev->kcov_handle);
> > > +#endif
> >
> > Shouldn't you hide these #ifdefs in a .h file?  This is not a "normal"
> > kernel coding style at all.
> 
> Well, if it's acceptable to add a kcov_handle field into vhost_dev
> even when CONFIG_KCOV is not enabled, then we can get rid of those
> #ifdefs.

It should be, it's not a big deal and there's not a ton of those
structures around that one more field is going to hurt anything...

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

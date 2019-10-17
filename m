Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE5DB84E
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 22:30:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9277DCA4;
	Thu, 17 Oct 2019 20:29:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CA13ACA4
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 20:29:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5B4868AD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 20:29:54 +0000 (UTC)
Received: from localhost (unknown [104.132.0.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 158E620872;
	Thu, 17 Oct 2019 20:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571344194;
	bh=PEewE7cb5xAZWn6VD0jRNI4cXRMWPcfpf8LoXljGvEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caek8QEbrHYk48IbnyN1/P119xslY0U+q6qPCikPPNyILCFyOmIuZMqk6hPo+5Iua
	sv3td2jDvNARP64Uomzz3fDwMu1LeIHD2mUsmR6Rea0X0IQ+ioeQtMYixoh8R88RFB
	C4t0n+FTQdJCIMcNk+cG9iBIs1peJGoWK0LflGuY=
Date: Thu, 17 Oct 2019 13:29:53 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH RFC 2/3] usb, kcov: collect coverage from hub_event
Message-ID: <20191017202953.GB1103978@kroah.com>
References: <cover.1571333592.git.andreyknvl@google.com>
	<1b30d1c9e7f86c25425c5ee53d7facede289608e.1571333592.git.andreyknvl@google.com>
	<20191017181943.GC1094415@kroah.com>
	<CAAeHK+zEoEbtk62raCU_10V_K97VAeebfJfuCRaf5DskT5yVhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAeHK+zEoEbtk62raCU_10V_K97VAeebfJfuCRaf5DskT5yVhw@mail.gmail.com>
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

On Thu, Oct 17, 2019 at 09:06:56PM +0200, Andrey Konovalov wrote:
> On Thu, Oct 17, 2019 at 8:19 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 17, 2019 at 07:44:14PM +0200, Andrey Konovalov wrote:
> > > This patch adds kcov_remote_start/kcov_remote_stop annotations to the
> > > hub_event function, which is responsible for processing events on USB
> > > buses, in particular events that happen during USB device enumeration.
> > > Each USB bus gets a unique id, which can be used to attach a kcov device
> > > to a particular USB bus for coverage collection.
> > >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> > > ---
> > >  drivers/usb/core/hub.c    | 4 ++++
> > >  include/linux/kcov.h      | 1 +
> > >  include/uapi/linux/kcov.h | 7 +++++++
> > >  3 files changed, 12 insertions(+)
> > >
> > > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > > index 236313f41f4a..03a40e41b099 100644
> > > --- a/drivers/usb/core/hub.c
> > > +++ b/drivers/usb/core/hub.c
> > > @@ -5374,6 +5374,8 @@ static void hub_event(struct work_struct *work)
> > >       hub_dev = hub->intfdev;
> > >       intf = to_usb_interface(hub_dev);
> > >
> > > +     kcov_remote_start(kcov_remote_handle_usb(hdev->bus->busnum));
> > > +
> > >       dev_dbg(hub_dev, "state %d ports %d chg %04x evt %04x\n",
> > >                       hdev->state, hdev->maxchild,
> > >                       /* NOTE: expects max 15 ports... */
> > > @@ -5480,6 +5482,8 @@ static void hub_event(struct work_struct *work)
> > >       /* Balance the stuff in kick_hub_wq() and allow autosuspend */
> > >       usb_autopm_put_interface(intf);
> > >       kref_put(&hub->kref, hub_release);
> > > +
> > > +     kcov_remote_stop();
> > >  }
> > >
> > >  static const struct usb_device_id hub_id_table[] = {
> > > diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> > > index 702672d98d35..38a47e0b67c2 100644
> > > --- a/include/linux/kcov.h
> > > +++ b/include/linux/kcov.h
> > > @@ -30,6 +30,7 @@ void kcov_task_exit(struct task_struct *t);
> > >  /*
> > >   * Reserved handle ranges:
> > >   * 0000000000000000 - 0000ffffffffffff : common handles
> > > + * 0001000000000000 - 0001ffffffffffff : USB subsystem handles
> >
> > So how many bits are you going to have for any in-kernel tasks?  Aren't
> > you going to run out quickly?
> 
> With these patches we only collect coverage from hub_event threads,
> and we need one ID per USB bus, the number of which is quite limited.
> But then we might want to collect coverage from other parts of the USB
> subsystem, so we might need more IDs. I don't expect the number of
> different subsystem from which we want to collect coverage to be
> large, so the idea here is to use 2 bytes of an ID to denote the
> subsystem, and the other 6 to denote different coverage collection
> sections within it.
> 
> But overall, which encoding scheme to use here is a good question.
> Ideas are welcome.
> 
> > >   */
> > >  void kcov_remote_start(u64 handle);
> > >  void kcov_remote_stop(void);
> > > diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> > > index 46f78f716ca9..45c9ae59cebc 100644
> > > --- a/include/uapi/linux/kcov.h
> > > +++ b/include/uapi/linux/kcov.h
> > > @@ -43,4 +43,11 @@ enum {
> > >  #define KCOV_CMP_SIZE(n)        ((n) << 1)
> > >  #define KCOV_CMP_MASK           KCOV_CMP_SIZE(3)
> > >
> > > +#define KCOV_REMOTE_HANDLE_USB  0x0001000000000000ull
> > > +
> > > +static inline __u64 kcov_remote_handle_usb(unsigned int bus)
> > > +{
> > > +     return KCOV_REMOTE_HANDLE_USB + (__u64)bus;
> > > +}
> >
> > Why is this function in a uapi .h file?  What userspace code would call
> > this?
> 
> A userspace process that wants to collect coverage from USB bus # N
> needs to pass kcov_remote_handle_usb(N) into KCOV_REMOTE_ENABLE ioctl.

Ugh, ok.  Then you should make "unsigned int bus" a __u64 so that this
actually will work on all kernels properly.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

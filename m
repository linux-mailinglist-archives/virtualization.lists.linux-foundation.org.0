Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE933144
	for <lists.virtualization@lfdr.de>; Mon,  3 Jun 2019 15:40:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80A22E18;
	Mon,  3 Jun 2019 13:40:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 753E1DD6
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 205AC83A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:40:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7438D308FBA9;
	Mon,  3 Jun 2019 13:40:16 +0000 (UTC)
Received: from gondolin (ovpn-204-96.brq.redhat.com [10.40.204.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9798C608A7;
	Mon,  3 Jun 2019 13:40:06 +0000 (UTC)
Date: Mon, 3 Jun 2019 15:40:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 2/8] s390/cio: introduce DMA pools to cio
Message-ID: <20190603154002.6da0186f.cohuck@redhat.com>
In-Reply-To: <20190603144706.2d458ccc.pasic@linux.ibm.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-3-mimu@linux.ibm.com>
	<20190603133745.240c00a7.cohuck@redhat.com>
	<20190603144706.2d458ccc.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 03 Jun 2019 13:40:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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

On Mon, 3 Jun 2019 14:47:06 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 3 Jun 2019 13:37:45 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 29 May 2019 14:26:51 +0200
> > Michael Mueller <mimu@linux.ibm.com> wrote:

> > > diff --git a/arch/s390/include/asm/cio.h b/arch/s390/include/asm/cio.h
> > > index 1727180e8ca1..43c007d2775a 100644
> > > --- a/arch/s390/include/asm/cio.h
> > > +++ b/arch/s390/include/asm/cio.h
> > > @@ -328,6 +328,17 @@ static inline u8 pathmask_to_pos(u8 mask)
> > >  void channel_subsystem_reinit(void);
> > >  extern void css_schedule_reprobe(void);
> > >  
> > > +extern void *cio_dma_zalloc(size_t size);
> > > +extern void cio_dma_free(void *cpu_addr, size_t size);
> > > +extern struct device *cio_get_dma_css_dev(void);
> > > +
> > > +struct gen_pool;  
> > 
> > That forward declaration is a bit ugly...   
> 
> Can you explain to me what is ugly about it so I can avoid similar
> mistakes in the future?
> 
> >I guess the alternative was
> > include hell?
> >   
> 
> What do you mean by include hell?
> 
> I decided to use a forward declaration because the guys that include
> "cio.h" are not expected to require the interfaces defined in
> linux/genalloc.h. My motivation to do it like this was the principle of
> encapsulation.

My personal rule-of-thumb is to include the header if it is
straightforward enough (e.g. if adding a basic header is enough). If
you need to include a header together with all of its friends and
family, a forward declaration is probably nicer. And of course,
sometimes it is simply needed.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

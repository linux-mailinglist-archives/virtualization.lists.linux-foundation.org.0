Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 355563D1AC
	for <lists.virtualization@lfdr.de>; Tue, 11 Jun 2019 18:04:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 63CBBEEE;
	Tue, 11 Jun 2019 16:04:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9ED9DB7D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 16:04:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C82E6D6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 16:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E7847FDFE;
	Tue, 11 Jun 2019 16:04:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10197611DA;
	Tue, 11 Jun 2019 16:04:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D31A018363C0;
	Tue, 11 Jun 2019 16:04:21 +0000 (UTC)
Date: Tue, 11 Jun 2019 12:04:21 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <1006124881.34430329.1560269061491.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190611150427.GA29288@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
	<20190610090730.8589-5-pagupta@redhat.com>
	<20190610192803.GA29002@redhat.com>
	<1206355816.34396746.1560258658768.JavaMail.zimbra@redhat.com>
	<20190611150427.GA29288@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v11 4/7] dm: enable synchronous dax
MIME-Version: 1.0
X-Originating-IP: [10.67.116.60, 10.4.195.3]
Thread-Topic: enable synchronous dax
Thread-Index: H4DObhswv6RiIzHdNTVFv9g9Hzvnew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 11 Jun 2019 16:04:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
	aarcange@redhat.com, dave jiang <dave.jiang@intel.com>,
	jstaron@google.com, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, willy@infradead.org,
	hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	rdunlap@infradead.org, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, imammedo@redhat.com,
	darrick wong <darrick.wong@oracle.com>
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



> 
> > Hi Mike,
> > 
> > Thanks for the review Please find my reply inline.
> > 
> > > 
> > > dm_table_supports_dax() is called multiple times (from
> > > dm_table_set_restrictions and dm_table_determine_type).  It is strange
> > > to have a getter have a side-effect of being a setter too.  Overloading
> > > like this could get you in trouble in the future.
> > > 
> > > Are you certain this is what you want?
> > 
> > I agree with you.
> > 
> > > 
> > > Or would it be better to refactor dm_table_supports_dax() to take an
> > > iterate_devices_fn arg and have callers pass the appropriate function?
> > > Then have dm_table_set_restrictions() caller do:
> > > 
> > >      if (dm_table_supports_dax(t, device_synchronous, NULL))
> > >                set_dax_synchronous(t->md->dax_dev);
> > > 
> > > (NULL arg implies dm_table_supports_dax() refactoring would take a int
> > > *data pointer rather than int type).
> > > 
> > > Mike
> > > 
> > 
> > I am sending below patch as per your suggestion. Does it look
> > near to what you have in mind?
> 
> Yes, it does.. just one nit I noticed inlined below.
> 
> > diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> > index 350cf0451456..8d89acc8b8c2 100644
> > --- a/drivers/md/dm-table.c
> > +++ b/drivers/md/dm-table.c
> 
> ...
> 
> > @@ -1910,8 +1919,13 @@ void dm_table_set_restrictions(struct dm_table *t,
> > struct request_queue *q,
> >         }
> >         blk_queue_write_cache(q, wc, fua);
> > 
> > -       if (dm_table_supports_dax(t, PAGE_SIZE))
> > +       if (dm_table_supports_dax(t, device_supports_dax, &page_size)) {
> > +
> 
> No need for an empty newline here ^

Sure. Will remove this and send official v12 patchset with the updated patch 4.

Thanks,
Pankaj

> 
> >                 blk_queue_flag_set(QUEUE_FLAG_DAX, q);
> > +               if (dm_table_supports_dax(t, device_synchronous, NULL))
> > +                       set_dax_synchronous(t->md->dax_dev);
> > +       }
> >         else
> >                 blk_queue_flag_clear(QUEUE_FLAG_DAX, q);
> > 
> 
> Thanks,
> Mike
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

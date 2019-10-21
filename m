Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4A7DECFA
	for <lists.virtualization@lfdr.de>; Mon, 21 Oct 2019 15:02:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 278A4DC1;
	Mon, 21 Oct 2019 13:01:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C29F4B49
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 13:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5F3D589B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571662912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=0XtuYVi16cRua7MI95pvO9rKONEjZD3Ff+zCiPew+iM=;
	b=Nhk0O4u0k6S+PnP//8PhmgCMATGUdEJLhQbMLiKTmnMBtSDBy1N1ffAtPDy8DrdZUJaeYZ
	tbGsM2CUsAnod8XqJ3UaaeYl1dR/l8dEu4l7q3d1F1w1pL6Oy8d5Xu/FDUyVOvjycmjqw7
	j5d32oPkJZE0MFQJRaJhltaWNuoZfk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-LdV4YUg_NRuCt4nf2SOzDQ-1; Mon, 21 Oct 2019 09:01:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E91B1100551E;
	Mon, 21 Oct 2019 13:01:48 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2DAD5DA8C;
	Mon, 21 Oct 2019 13:01:43 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 8625D2202E5; Mon, 21 Oct 2019 09:01:43 -0400 (EDT)
Date: Mon, 21 Oct 2019 09:01:43 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [PATCH 5/5] virtiofs: Retry request submission from worker context
Message-ID: <20191021130143.GB13573@redhat.com>
References: <20191015174626.11593-1-vgoyal@redhat.com>
	<20191015174626.11593-6-vgoyal@redhat.com>
	<CAJfpegvg1ePA7=Fm3499bKsZBv_98j817KCDxOU18j=BdVfHyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJfpegvg1ePA7=Fm3499bKsZBv_98j817KCDxOU18j=BdVfHyA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: LdV4YUg_NRuCt4nf2SOzDQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: chirantan@chromium.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
	Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org
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

On Mon, Oct 21, 2019 at 10:15:18AM +0200, Miklos Szeredi wrote:
[..]
> > @@ -268,13 +272,43 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
> >                                                list);
> >                 if (!req) {
> >                         spin_unlock(&fsvq->lock);
> > -                       return;
> > +                       break;
> >                 }
> >
> >                 list_del_init(&req->list);
> >                 spin_unlock(&fsvq->lock);
> >                 fuse_request_end(fc, req);
> >         }
> > +
> > +       /* Dispatch pending requests */
> > +       while (1) {
> > +               spin_lock(&fsvq->lock);
> > +               req = list_first_entry_or_null(&fsvq->queued_reqs,
> > +                                              struct fuse_req, list);
> > +               if (!req) {
> > +                       spin_unlock(&fsvq->lock);
> > +                       return;
> > +               }
> > +               list_del_init(&req->list);
> > +               spin_unlock(&fsvq->lock);
> > +
> > +               ret = virtio_fs_enqueue_req(fsvq, req, true);
> > +               if (ret < 0) {
> > +                       if (ret == -ENOMEM || ret == -ENOSPC) {
> > +                               spin_lock(&fsvq->lock);
> > +                               list_add_tail(&req->list, &fsvq->queued_reqs);
> > +                               schedule_delayed_work(&fsvq->dispatch_work,
> > +                                                     msecs_to_jiffies(1));
> > +                               spin_unlock(&fsvq->lock);
> > +                               return;
> > +                       }
> > +                       req->out.h.error = ret;
> > +                       dec_in_flight_req(fsvq);
> 
> Missing locking.  Fixed.

Good catch. Thanks.

Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

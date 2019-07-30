Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FABB7AD3C
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 18:06:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 471B83076;
	Tue, 30 Jul 2019 16:06:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C738B2F29
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 15:57:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6185DA8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 15:57:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD19A300CB0C;
	Tue, 30 Jul 2019 15:57:17 +0000 (UTC)
Received: from redhat.com (ovpn-112-36.rdu2.redhat.com [10.10.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A63655D6A7;
	Tue, 30 Jul 2019 15:57:05 +0000 (UTC)
Date: Tue, 30 Jul 2019 11:57:02 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/12] block: bio_release_pages: use flags arg instead of
	bool
Message-ID: <20190730155702.GB10366@redhat.com>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724042518.14363-4-jhubbard@nvidia.com>
	<20190724053053.GA18330@infradead.org>
	<20190729205721.GB3760@redhat.com> <20190730102557.GA1700@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730102557.GA1700@lst.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 30 Jul 2019 15:57:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	linux-cifs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
	linux-rdma@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Minwoo Im <minwoo.im.dev@gmail.com>, v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, john.hubbard@gmail.com,
	linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
	ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Jul 30, 2019 at 12:25:57PM +0200, Christoph Hellwig wrote:
> On Mon, Jul 29, 2019 at 04:57:21PM -0400, Jerome Glisse wrote:
> > > All pages releases by bio_release_pages should come from
> > > get_get_user_pages, so I don't really see the point here.
> > =

> > No they do not all comes from GUP for see various callers
> > of bio_check_pages_dirty() for instance iomap_dio_zero()
> > =

> > I have carefully tracked down all this and i did not do
> > anyconvertion just for the fun of it :)
> =

> Well, the point is _should_ not necessarily do.  iomap_dio_zero adds the
> ZERO_PAGE, which we by definition don't need to refcount.  So we can
> mark this bio BIO_NO_PAGE_REF safely after removing the get_page there.
> =

> Note that the equivalent in the old direct I/O code, dio_refill_pages,
> will be a little more complicated as it can match user pages and the
> ZERO_PAGE in a single bio, so a per-bio flag won't handle it easily.
> Maybe we just need to use a separate bio there as well.
> =

> In general with series like this we should not encode the status quo an
> pile new hacks upon the old one, but thing where we should be and fix
> up the old warts while having to wade through all that code.

Other user can also add page that are not coming from GUP but need to
have a reference see __blkdev_direct_IO() saddly bio get fill from many
different places and not always with GUP. So we can not say that all
pages here are coming from bio. I had a different version of the patchset
i think that was adding a new release dirty function for GUP versus non
GUP bio. I posted it a while ago, i will try to dig it up once i am
back.

Cheers,
J=E9r=F4me
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

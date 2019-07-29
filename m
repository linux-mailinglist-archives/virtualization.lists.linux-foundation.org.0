Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF479A8A
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 23:02:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7FA482168;
	Mon, 29 Jul 2019 21:02:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3B8F01EA6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 20:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DC576604
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 20:57:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40047C060204;
	Mon, 29 Jul 2019 20:57:37 +0000 (UTC)
Received: from redhat.com (ovpn-112-31.rdu2.redhat.com [10.10.112.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8C65C219;
	Mon, 29 Jul 2019 20:57:24 +0000 (UTC)
Date: Mon, 29 Jul 2019 16:57:21 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 03/12] block: bio_release_pages: use flags arg instead of
	bool
Message-ID: <20190729205721.GB3760@redhat.com>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
	<20190724042518.14363-4-jhubbard@nvidia.com>
	<20190724053053.GA18330@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724053053.GA18330@infradead.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 29 Jul 2019 20:57:38 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On Tue, Jul 23, 2019 at 10:30:53PM -0700, Christoph Hellwig wrote:
> On Tue, Jul 23, 2019 at 09:25:09PM -0700, john.hubbard@gmail.com wrote:
> > From: John Hubbard <jhubbard@nvidia.com>
> > =

> > In commit d241a95f3514 ("block: optionally mark pages dirty in
> > bio_release_pages"), new "bool mark_dirty" argument was added to
> > bio_release_pages.
> > =

> > In upcoming work, another bool argument (to indicate that the pages came
> > from get_user_pages) is going to be added. That's one bool too many,
> > because it's not desirable have calls of the form:
> =

> All pages releases by bio_release_pages should come from
> get_get_user_pages, so I don't really see the point here.

No they do not all comes from GUP for see various callers
of bio_check_pages_dirty() for instance iomap_dio_zero()

I have carefully tracked down all this and i did not do
anyconvertion just for the fun of it :)

Cheers,
J=E9r=F4me
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

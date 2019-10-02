Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546DC8AB6
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 16:17:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C99A0EF6;
	Wed,  2 Oct 2019 14:17:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4788FEEF
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:17:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CDB4E8A0
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:17:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 444F269089;
	Wed,  2 Oct 2019 14:17:08 +0000 (UTC)
Received: from redhat.com (ovpn-112-19.rdu2.redhat.com [10.10.112.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E37600CE;
	Wed,  2 Oct 2019 14:16:58 +0000 (UTC)
Date: Wed, 2 Oct 2019 10:15:42 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20191002141542.GA5669@redhat.com>
References: <20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com>
	<20190815201630.GA25517@redhat.com>
	<VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 02 Oct 2019 14:17:08 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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

On Wed, Oct 02, 2019 at 03:46:30PM +0200, Paolo Bonzini wrote:
> On 02/10/19 21:27, Jerome Glisse wrote:
> > On Tue, Sep 10, 2019 at 07:49:51AM +0000, Mircea CIRJALIU - MELIU wrote:
> >>> On 05/09/19 20:09, Jerome Glisse wrote:
> >>>> Not sure i understand, you are saying that the solution i outline
> >>>> above does not work ? If so then i think you are wrong, in the above
> >>>> solution the importing process mmap a device file and the resulting
> >>>> vma is then populated using insert_pfn() and constantly keep
> >>>> synchronize with the target process through mirroring which means th=
at
> >>>> you never have to look at the struct page ... you can mirror any kind
> >>>> of memory from the remote process.
> >>>
> >>> If insert_pfn in turn calls MMU notifiers for the target VMA (which w=
ould be
> >>> the KVM MMU notifier), then that would work.  Though I guess it would=
 be
> >>> possible to call MMU notifier update callbacks around the call to ins=
ert_pfn.
> >>
> >> Can't do that.
> >> First, insert_pfn() uses set_pte_at() which won't trigger the MMU noti=
fier on
> >> the target VMA. It's also static, so I'll have to access it thru vmf_i=
nsert_pfn()
> >> or vmf_insert_mixed().
> > =

> > Why would you need to target mmu notifier on target vma ?
> =

> If the mapping of the source VMA changes, mirroring can update the
> target VMA via insert_pfn.  But what ensures that KVM's MMU notifier
> dismantles its own existing page tables (so that they can be recreated
> with the new mapping from the source VMA)?
> =


So just to make sure i follow we have:
      - qemu process on host with anonymous vma
            -> host cpu page table
      - kvm which maps host anonymous vma to guest
            -> kvm guest page table
      - kvm inspector process which mirror vma from qemu process
            -> inspector process page table

AFAIK the KVM notifier's will clear the kvm guest page table whenever
necessary (through kvm_mmu_notifier_invalidate_range_start). This is
what ensure that KVM's dismatles its own mapping, it abides to mmu-
notifier callbacks. If you did not you would have bugs (at least i
expect so). Am i wrong here ?

The mirroring kernel driver would also register the notifier against
the quemu process and would also abide to notifier callbacks.

What you want to maintain at all times is that none of the actors
above ever look at different page for the same virtual address (ie
one looking at older page while another look at new page).

This is where you have helper like HMM that make sure that you can
not populate the mirroring vma while a notifier is on going. Which
means that everything is serialize on the notifier.

Cheers,
J=E9r=F4me
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

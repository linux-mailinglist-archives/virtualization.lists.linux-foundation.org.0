Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 162DDCA14B
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 17:44:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3BAA7107A;
	Thu,  3 Oct 2019 15:44:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2D8521071
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 15:44:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B00E05D3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 15:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD2AD3082231;
	Thu,  3 Oct 2019 15:43:58 +0000 (UTC)
Received: from redhat.com (ovpn-112-54.rdu2.redhat.com [10.10.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DB7119C69;
	Thu,  3 Oct 2019 15:43:49 +0000 (UTC)
Date: Thu, 3 Oct 2019 11:42:33 -0400
From: Jerome Glisse <jglisse@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: DANGER WILL ROBINSON, DANGER
Message-ID: <20191003154233.GA4421@redhat.com>
References: <VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
	<f26710a4-424f-730c-a676-901bae451409@redhat.com>
	<20191002170429.GA8189@redhat.com>
	<dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 03 Oct 2019 15:43:59 +0000 (UTC)
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

On Wed, Oct 02, 2019 at 10:10:18PM +0200, Paolo Bonzini wrote:
> On 02/10/19 19:04, Jerome Glisse wrote:
> > On Wed, Oct 02, 2019 at 06:18:06PM +0200, Paolo Bonzini wrote:
> >>>> If the mapping of the source VMA changes, mirroring can update the
> >>>> target VMA via insert_pfn.  But what ensures that KVM's MMU notifier
> >>>> dismantles its own existing page tables (so that they can be recreat=
ed
> >>>> with the new mapping from the source VMA)?
> >>
> >> The KVM inspector process is also (or can be) a QEMU that will have to
> >> create its own KVM guest page table.  So if a page in the source VMA is
> >> unmapped we want:
> >>
> >> - the source KVM to invalidate its guest page table (done by the KVM M=
MU
> >> notifier)
> >>
> >> - the target VMA to be invalidated (easy using mirroring)
> >>
> >> - the target KVM to invalidate its guest page table, as a result of
> >> invalidation of the target VMA
> > =

> > You can do the target KVM invalidation inside the mirroring invalidation
> > code.
> =

> Why should the source and target KVMs behave differently?  If the source
> invalidates its guest page table via MMU notifiers, so should the target.
> =

> The KVM MMU notifier exists so that nothing (including mirroring) needs
> to know that there is KVM on the other side.  Any interaction between
> KVM page tables and VMAs must be mediated by MMU notifiers, anything
> else is unacceptable.
> =

> If it is possible to invoke the MMU notifiers around the calls to
> insert_pfn, that of course would be perfect.

Ok and yes you can do that exactly ie inside the mmu notifier callback
from the target. For instance it is as easy as:
    target_mirror_notifier_start_callback(start, end) {
        struct kvm_mirror_struct *kvmms =3D from_mmun(...);
        unsigned long target_foff, size;

        size =3D end - start;
        target_foff =3D kvmms_convert_mirror_address(start);
        take_lock(kvmms->mirror_fault_exclusion_lock);
        unmap_mapping_range(kvmms->address_space, target_foff, size, 1);
        drop_lock(kvmms->mirror_fault_exclusion_lock);
    }

All that is needed is to make sure that vm_normal_page() will see those
pte (inside the process that is mirroring the other process) as special
which is the case either because insert_pfn() mark the pte as special or
the kvm device driver which control the vm_operation struct set a
find_special_page() callback that always return NULL, or the vma has
either VM_PFNMAP or VM_MIXEDMAP set (which is the case with insert_pfn).

So you can keep the existing kvm code unmodified.

Cheers,
J=E9r=F4me
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

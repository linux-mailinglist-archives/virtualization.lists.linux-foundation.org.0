Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF122B143
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 11:26:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0234C16CB;
	Mon, 27 May 2019 09:26:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 53C8316BD;
	Mon, 27 May 2019 09:26:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5FB5F13A;
	Mon, 27 May 2019 09:26:07 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id BF9BB26B; Mon, 27 May 2019 11:26:04 +0200 (CEST)
Date: Mon, 27 May 2019 11:26:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v7 0/7] Add virtio-iommu driver
Message-ID: <20190527092604.GB21613@8bytes.org>
References: <20190115121959.23763-1-jean-philippe.brucker@arm.com>
	<20190512123022-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512123022-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: mark.rutland@arm.com, virtio-dev@lists.oasis-open.org,
	lorenzo.pieralisi@arm.com, tnowicki@caviumnetworks.com,
	devicetree@vger.kernel.org,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	linux-pci@vger.kernel.org, will.deacon@arm.com,
	robin.murphy@arm.com, virtualization@lists.linux-foundation.org,
	eric.auger@redhat.com, iommu@lists.linux-foundation.org,
	robh+dt@kernel.org, marc.zyngier@arm.com, bhelgaas@google.com,
	kvmarm@lists.cs.columbia.edu
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

On Sun, May 12, 2019 at 12:31:59PM -0400, Michael S. Tsirkin wrote:
> OK this has been in next for a while.
> 
> Last time IOMMU maintainers objected. Are objections
> still in force?
> 
> If not could we get acks please?

No objections against the code, I only hesitated because the Spec was
not yet official.

So for the code:

	Acked-by: Joerg Roedel <jroedel@suse.de>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

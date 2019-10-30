Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 66786E995B
	for <lists.virtualization@lfdr.de>; Wed, 30 Oct 2019 10:43:31 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 88463DCA;
	Wed, 30 Oct 2019 09:43:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41081491;
	Wed, 30 Oct 2019 09:43:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BAE9F8A;
	Wed, 30 Oct 2019 09:43:19 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 3EE1334A; Wed, 30 Oct 2019 10:43:17 +0100 (CET)
Date: Wed, 30 Oct 2019 10:43:15 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Cristiane Naves <cristianenavescardoso09@gmail.com>
Subject: Re: [PATCH] iommu/virtio: Remove unused variable
Message-ID: <20191030094315.GC7254@8bytes.org>
References: <20191025161340.GA31368@cristiane-Inspiron-5420>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025161340.GA31368@cristiane-Inspiron-5420>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B, 
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Julia Lawall <julia.lawall@lip6.fr>, Greg KH <gregkh@linuxfoundation.org>,
	virtualization@lists.linux-foundation.org,
	outreachy-kernel@googlegroups.com, iommu@lists.linux-foundation.org
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

On Fri, Oct 25, 2019 at 01:13:40PM -0300, Cristiane Naves wrote:
> Remove the variable of return. Issue found by
> coccicheck(scripts/coccinelle/misc/returnvar.cocci)
> 
> Signed-off-by: Cristiane Naves <cristianenavescardoso09@gmail.com>
> ---
>  drivers/iommu/virtio-iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied for v5.5, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4D21AD7F1
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 09:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C06388164;
	Fri, 17 Apr 2020 07:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMWupG46ivbX; Fri, 17 Apr 2020 07:48:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B54C864B8;
	Fri, 17 Apr 2020 07:48:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB4BC0172;
	Fri, 17 Apr 2020 07:48:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDDF7C0172
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD2D488164
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q2gF0BFNBfvh
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:48:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C95FF864B8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:48:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE889AF0D;
 Fri, 17 Apr 2020 07:48:33 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: Update PARAVIRT_OPS_INTERFACE and
 VMWARE_HYPERVISOR_INTERFACE
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Deep Shah <sdeep@vmware.com>, linux-kernel@vger.kernel.org
References: <20200416234520.GA1700@prme-mon-cfl-mlw-07>
 <84f719e9-3af0-4242-f50b-990371d4768a@suse.com>
Message-ID: <155feefc-598b-023d-1e78-56cbce9f4a1a@suse.com>
Date: Fri, 17 Apr 2020 09:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <84f719e9-3af0-4242-f50b-990371d4768a@suse.com>
Content-Language: en-US
Cc: pv-drivers@vmware.com, thellstrom@vmware.com,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMTcuMDQuMjAgMDg6MjIsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMTcuMDQuMjAgMDE6
NDUsIERlZXAgU2hhaCB3cm90ZToKPj4gVGhvbWFzIEhlbGxzdHJvbSB3aWxsIGJlIGhhbmRpbmcg
b3ZlciBWTXdhcmUncyBtYWludGFpbmVyc2hpcCBvZiB0aGVzZQo+PiBpbnRlcmZhY2VzIHRvIERl
ZXAgU2hhaC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGVlcCBTaGFoIDxzZGVlcEB2bXdhcmUuY29t
Pgo+PiBBY2tlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+
IAo+IEFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpCVFcsIEkgY2Fu
IGNhcnJ5IHRoaXMgcGF0Y2ggdGhyb3VnaCB0aGUgWGVuIHRyZWUgaWYgbm9ib2R5IGVsc2Ugd2Fu
dHMgdG8KdGFrZSBpdC4uLgoKCkp1ZXJnZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u

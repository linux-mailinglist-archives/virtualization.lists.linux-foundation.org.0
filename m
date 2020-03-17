Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD5187D66
	for <lists.virtualization@lfdr.de>; Tue, 17 Mar 2020 10:49:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1393C88C48;
	Tue, 17 Mar 2020 09:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DY1TfCi2qj6l; Tue, 17 Mar 2020 09:49:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 798B388C0A;
	Tue, 17 Mar 2020 09:49:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A103C013E;
	Tue, 17 Mar 2020 09:49:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D585EC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 09:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F065187046
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 09:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YtAhMBTlboul
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 09:48:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 650AE8703F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 09:48:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7006AAC23;
 Tue, 17 Mar 2020 09:48:49 +0000 (UTC)
Subject: Re: [PATCH RFC v2 12/24] hpsa: use reserved commands
To: John Garry <john.garry@huawei.com>, Ming Lei <ming.lei@redhat.com>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-13-git-send-email-john.garry@huawei.com>
 <20200311081059.GC31504@ming.t460p>
 <a76ab13a-85a3-0d88-595f-af13ef1b3fe3@huawei.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <881b6a9b-2137-946f-a900-5c4e6cf1fe37@suse.de>
Date: Tue, 17 Mar 2020 10:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a76ab13a-85a3-0d88-595f-af13ef1b3fe3@huawei.com>
Content-Language: en-US
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 linux-scsi@vger.kernel.org
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

T24gMy8xNy8yMCAxMDozOCBBTSwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAxMS8wMy8yMDIwIDA4
OjEwLCBNaW5nIExlaSB3cm90ZToKPj4+IGFuZHMoc3RydWN0IGN0bHJfaW5mbyAqaCkKPj4+IEBA
IC01ODAzLDYgKzU4MDMsNyBAQCBzdGF0aWMgaW50IGhwc2Ffc2NzaV9ob3N0X2FsbG9jKHN0cnVj
dCAKPj4+IGN0bHJfaW5mbyAqaCkKPj4+IMKgwqDCoMKgwqAgc2gtPm1heF9sdW4gPSBIUFNBX01B
WF9MVU47Cj4+PiDCoMKgwqDCoMKgIHNoLT5tYXhfaWQgPSBIUFNBX01BWF9MVU47Cj4+PiDCoMKg
wqDCoMKgIHNoLT5jYW5fcXVldWUgPSBoLT5ucl9jbWRzIC0gSFBTQV9OUkVTRVJWRURfQ01EUzsK
Pj4+ICvCoMKgwqAgc2gtPm5yX3Jlc2VydmVkX2NtZHMgPSBIUFNBX05SRVNFUlZFRF9DTURTOwo+
PiBOb3cgLm5yX3Jlc2VydmVkX2NtZHMgaGFzIGJlZW4gcGFzc2VkIHRvIGJsay1tcSwgeW91IG5l
ZWQgdG8gaW5jcmVhc2UKPj4gc2gtPmNhbl9xdWV1ZSB0byBoLT5ucl9jbWRzLCBiZWNhdXNlIC5j
YW5fcXVldWUgaXMgdGhlIHdob2xlIHF1ZXVlIGRlcHRoCj4+IChpbmNsdWRlIHRoZSBwYXJ0IG9m
IHJlc2VydmVkIHRhZ3MpLCBvdGhlcndpc2UsIElPIHRhZ3Mgd2lsbCBiZQo+PiBkZWNyZWFzZWQu
Cj4+Cj4gCj4gU291bmRzIGNvcnJlY3QuCj4gCkkgd2lsbCBoYXZlIGhhdmluZyBhIGxvb2sgYXQg
dGhlIHBhdGNoc2V0OyBJIHRob3VnaHQgSSBkaWQgYSBwYXRjaCB0byAKbW9kaWZ5IC5jYW5fcXVl
dWUgc28gdGhhdCBpdCB3b3VsZCBjb3ZlciBvbmx5IHRoZSB1c2FibGUgdGFncywgbm90IHRoZSAK
cmVzZXJ2ZWQgb25lcy4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAg
ICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5
IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==

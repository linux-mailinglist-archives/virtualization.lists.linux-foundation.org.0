Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E163181132
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 07:55:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC185203B8;
	Wed, 11 Mar 2020 06:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfpoB5TyH+dq; Wed, 11 Mar 2020 06:55:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8D0E42039B;
	Wed, 11 Mar 2020 06:55:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64E95C0177;
	Wed, 11 Mar 2020 06:55:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61317C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4A54E864F2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsxbgX2TeK6Z
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:55:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D11A864DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:55:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 27380AF47;
 Wed, 11 Mar 2020 06:55:47 +0000 (UTC)
Subject: Re: [PATCH RFC v2 01/24] scsi: add 'nr_reserved_cmds' field to the
 SCSI host template
To: Ming Lei <ming.lei@redhat.com>, John Garry <john.garry@huawei.com>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-2-git-send-email-john.garry@huawei.com>
 <20200310230835.GA16056@ming.t460p>
From: Hannes Reinecke <hare@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=hare@suse.de; prefer-encrypt=mutual; keydata=
 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
 azzYF4VRJsdl+d0MCaSy8mUh
Message-ID: <fecc400c-fe6b-144a-51f9-1b3b2704c1a2@suse.de>
Date: Wed, 11 Mar 2020 07:55:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200310230835.GA16056@ming.t460p>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gMy8xMS8yMCAxMjowOCBBTSwgTWluZyBMZWkgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMTEsIDIw
MjAgYXQgMTI6MjU6MjdBTSArMDgwMCwgSm9obiBHYXJyeSB3cm90ZToKPj4gRnJvbTogSGFubmVz
IFJlaW5lY2tlIDxoYXJlQHN1c2UuY29tPgo+Pgo+PiBBZGQgYSBuZXcgZmllbGQgJ25yX3Jlc2Vy
dmVkX2NtZHMnIHRvIHRoZSBTQ1NJIGhvc3QgdGVtcGxhdGUgdG8KPj4gaW5zdHJ1Y3QgdGhlIGJs
b2NrIGxheWVyIHRvIHNldCBhc2lkZSBhIHRhZyBzcGFjZSBmb3IgcmVzZXJ2ZWQKPj4gY29tbWFu
ZHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmNvbT4K
Pj4gLS0tCj4+ICBkcml2ZXJzL3Njc2kvc2NzaV9saWIuYyAgfCAxICsKPj4gIGluY2x1ZGUvc2Nz
aS9zY3NpX2hvc3QuaCB8IDYgKysrKysrCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMgYi9kcml2ZXJz
L3Njc2kvc2NzaV9saWIuYwo+PiBpbmRleCA2MTBlZTQxZmE1NGMuLjI5NjczMjVkZjdhMCAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMKPj4gKysrIGIvZHJpdmVycy9zY3Np
L3Njc2lfbGliLmMKPj4gQEAgLTE4OTYsNiArMTg5Niw3IEBAIGludCBzY3NpX21xX3NldHVwX3Rh
Z3Moc3RydWN0IFNjc2lfSG9zdCAqc2hvc3QpCj4+ICAJCXNob3N0LT50YWdfc2V0Lm9wcyA9ICZz
Y3NpX21xX29wc19ub19jb21taXQ7Cj4+ICAJc2hvc3QtPnRhZ19zZXQubnJfaHdfcXVldWVzID0g
c2hvc3QtPm5yX2h3X3F1ZXVlcyA/IDogMTsKPj4gIAlzaG9zdC0+dGFnX3NldC5xdWV1ZV9kZXB0
aCA9IHNob3N0LT5jYW5fcXVldWU7Cj4+ICsJc2hvc3QtPnRhZ19zZXQucmVzZXJ2ZWRfdGFncyA9
IHNob3N0LT5ucl9yZXNlcnZlZF9jbWRzOwo+IAo+IFlvdSByZXNlcnZlIHRhZ3MgZm9yIHNwZWNp
YWwgdXNhZ2UsIG1lYW50aW1lIHRoZSB3aG9sZSBxdWV1ZSBkZXB0aAo+IGlzbid0IGluY3JlYXNl
ZCwgdGhhdCBtZWFucyB0aGUgdGFncyBmb3IgSU8gcmVxdWVzdCBpcyBkZWNyZWFzZWQgZ2l2ZW4K
PiByZXNlcnZlZCB0YWdzIGNhbid0IGJlIHVzZWQgZm9yIElPLCBzbyBJTyBwZXJmb3JtYW5jZSBt
YXkgYmUgZWZmZWN0ZWQuCj4gCj4gSWYgbm90IHRoZSBjYXNlLCBwbGVhc2UgZXhwbGFpbiBhIGJp
dCBpbiBjb21taXQgbG9nLgo+IApUaGUgb3ZlcmFsbCBpZGVhIG9mIHRoaXMgcGF0Y2hzZXQgaXMg
dG8gZm9sZCBfZXhpc3RpbmdfIG1hbmFnZW1lbnQKY29tbWFuZCBoYW5kbGluZyBpbnRvIHVzaW5n
IHRoZSBibGstbXEgYml0bWFwLgpDdXJyZW50bHksIHF1aXRlIGEgbG90IG9mIGRyaXZlcnMgYXJl
IHVzaW5nIG1hbmFnZW1lbnQgY29tbWFuZHMKaW50ZXJuYWxseSwgd2hpY2ggdHlwaWNhbGx5IHVz
ZSB0aGUgc2FtZSBoYXJkd2FyZSB0YWcgcG9vbCAoaWUgdGhleSBhcmUKYmVpbmcgYWxsb2NhdGVk
IGZyb20gdGhlIHNhbWUgaGFyZHdhcmUgcmVzb3VyY2VzKSB0aGFuIHRoZSAnbm9ybWFsJyBJL08K
Y29tbWFuZHMuCkJ1dCBhcyB0aGV5IGFyZSB1c2luZyB0aGUgc2FtZSB0YWdwb29sIHRoZXNlIGRy
aXZlcnMgYWxyZWFkeSBkZWNyZW1lbnQKdGhlIGF2YWlsYWJsZSBudW1iZXIgb2YgY29tbWFuZHM7
IGNoZWNrIGVnLiBocHNhOgoKc3RhdGljIGludCBocHNhX3Njc2lfaG9zdF9hbGxvYyhzdHJ1Y3Qg
Y3Rscl9pbmZvICpoKQp7CglzdHJ1Y3QgU2NzaV9Ib3N0ICpzaDsKCglzaCA9IHNjc2lfaG9zdF9h
bGxvYygmaHBzYV9kcml2ZXJfdGVtcGxhdGUsIHNpemVvZihoKSk7CglpZiAoc2ggPT0gTlVMTCkg
ewoJCWRldl9lcnIoJmgtPnBkZXYtPmRldiwgInNjc2lfaG9zdF9hbGxvYyBmYWlsZWRcbiIpOwoJ
CXJldHVybiAtRU5PTUVNOwoJfQoKCXNoLT5pb19wb3J0ID0gMDsKCXNoLT5uX2lvX3BvcnQgPSAw
OwoJc2gtPnRoaXNfaWQgPSAtMTsKCXNoLT5tYXhfY2hhbm5lbCA9IDM7CglzaC0+bWF4X2NtZF9s
ZW4gPSBNQVhfQ09NTUFORF9TSVpFOwoJc2gtPm1heF9sdW4gPSBIUFNBX01BWF9MVU47CglzaC0+
bWF4X2lkID0gSFBTQV9NQVhfTFVOOwoJc2gtPmNhbl9xdWV1ZSA9IGgtPm5yX2NtZHMgLSBIUFNB
X05SRVNFUlZFRF9DTURTOwoJc2gtPmNtZF9wZXJfbHVuID0gc2gtPmNhbl9xdWV1ZTsKClNvIHRo
ZSBpZGVhIG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gY29udmVydCBleGlzdGluZyB1c2UtY2FzZXM7
IHNlZWluZwp0aGF0IHRoZXkgYWxyZWFkeSByZXNlcnZlIGNvbW1hbmRzIGludGVybmFsbHkgcGVy
Zm9ybWFuY2Ugd2lsbCBub3QgYmUKYWZmZWN0ZWQuCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBI
YW5uZXMgUmVpbmVja2UJCSAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVA
c3VzZS5kZQkJCSAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
CkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR0Y6IEZlbGl4IEltZW5kw7ZyZmZlcgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=

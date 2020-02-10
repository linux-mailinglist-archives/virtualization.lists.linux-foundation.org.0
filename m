Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E5812157297
	for <lists.virtualization@lfdr.de>; Mon, 10 Feb 2020 11:10:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AEBF84237;
	Mon, 10 Feb 2020 10:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7HJDnzP29Ck; Mon, 10 Feb 2020 10:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F02E4842EA;
	Mon, 10 Feb 2020 10:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2B60C0171;
	Mon, 10 Feb 2020 10:10:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8D30C0171
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 10:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4C4086DCA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 10:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JO66zcnMq7cQ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 10:10:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2D8C786DA5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 10:10:03 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AA8sed141844 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 05:10:02 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y1tnug98w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Feb 2020 05:10:01 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <virtualization@lists.linux-foundation.org> from <borntraeger@de.ibm.com>; 
 Mon, 10 Feb 2020 10:09:59 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 10 Feb 2020 10:09:57 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01AA9uB942598536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Feb 2020 10:09:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81C9AAE051;
 Mon, 10 Feb 2020 10:09:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B656AE053;
 Mon, 10 Feb 2020 10:09:56 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.98.183])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Feb 2020 10:09:56 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date: Mon, 10 Feb 2020 11:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20021010-4275-0000-0000-0000039FB489
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021010-4276-0000-0000-000038B3E7E9
Message-Id: <656663f4-87b5-5efa-07e5-235a0a5d4597@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_02:2020-02-10,
 2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100079
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, kvm list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Halil Pasic <pasic@linux.ibm.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

CgpPbiAxMC4wMi4yMCAxMDo0MCwgRXVnZW5pbyBQZXJleiBNYXJ0aW4gd3JvdGU6Cj4gSGkgQ2hy
aXN0aWFuLgo+IAo+IEknbSBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGZhaWx1cmUgd2l0aCBl
Y2NiODUyZjFmZTZiZWRlNjMwZTJlNGYxYTEyMWE4MWUzNDM1NGFiIGNvbW1pdC4gQ291bGQgeW91
IGFkZCBtb3JlIGRhdGE/IFlvdXIgY29uZmlndXJhdGlvbiAobGlidmlydCBvciBxZW11IGxpbmUp
LCBhbmQgaG9zdCdzIGRtZXNnIG91dHB1dCBpZiBhbnk/CgpJIGRvIHRoZSBmb2xsb3dpbmcgaW4g
dGhlIGd1ZXN0OgpwaW5nIC1jIDIwMCAtZiBzb21ldmFsaWRpcDsgcmVib290CnNvbWV0aW1lcyBJ
IG5lZWQgdG8gZG8gdGhhdCBtdWx0aXBsZSB0aW1lcyBhbmQgc29tZXRpbWVzIEkgZG8gbm90IGdl
dCBhIGd1ZXN0IGNyYXNoIGJ1dCBob3N0IGRtZXNnIGxpa2UKCkd1ZXN0IG1vdmVkIHVzZWQgaW5k
ZXggZnJvbSAwIHRvIDI5MgoKeG1sIGlzIHByZXR0eSBzaW1wbGUKCiAgICA8aW50ZXJmYWNlIHR5
cGU9J2RpcmVjdCc+CiAgICAgIDxtYWMgYWRkcmVzcz0nNTI6NTQ6MDA6N2M6MmM6ZjMnLz4KICAg
ICAgPHNvdXJjZSBkZXY9J2VuY2JkMDAnIG1vZGU9J2JyaWRnZScvPgogICAgICA8bW9kZWwgdHlw
ZT0ndmlydGlvJy8+CiAgICAgIDxkcml2ZXIgbmFtZT0ndmhvc3QnLz4KICAgICAgPGFkZHJlc3Mg
dHlwZT0nY2N3JyBjc3NpZD0nMHhmZScgc3NpZD0nMHgwJyBkZXZubz0nMHgwMDAxJy8+CiAgICA8
L2ludGVyZmFjZT4KCgpSZXZlcnRpbmcgdGhpcyBwYXRjaCBzZWVtcyB0byBtYWtlIGJvdGggcHJv
YmxlbXMgZ28gYXdheS4KCgo+IAo+IFRoYW5rcyEKPiAKPiBPbiBGcmksIEZlYiA3LCAyMDIwIGF0
IDk6MTMgQU0gQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIDxib3JudHJhZWdlckBkZS5pYm0uY29tIDxt
YWlsdG86Ym9ybnRyYWVnZXJAZGUuaWJtLmNvbT4+IHdyb3RlOgo+IAo+IAo+IAo+ICAgICBPbiAw
Ny4wMi4yMCAwODo1OCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+ICAgICA+IE9uIEZyaSwg
RmViIDA3LCAyMDIwIGF0IDA4OjQ3OjE0QU0gKzAxMDAsIENocmlzdGlhbiBCb3JudHJhZWdlciB3
cm90ZToKPiAgICAgPj4gQWxzbyBhZGRpbmcgQ29ybmVsaWEuCj4gICAgID4+Cj4gICAgID4+Cj4g
ICAgID4+IE9uIDA2LjAyLjIwIDIzOjE3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gICAg
ID4+PiBPbiBUaHUsIEZlYiAwNiwgMjAyMCBhdCAwNDoxMjoyMVBNICswMTAwLCBDaHJpc3RpYW4g
Qm9ybnRyYWVnZXIgd3JvdGU6Cj4gICAgID4+Pj4KPiAgICAgPj4+Pgo+ICAgICA+Pj4+IE9uIDA2
LjAyLjIwIDE1OjIyLCBlcGVyZXptYUByZWRoYXQuY29tIDxtYWlsdG86ZXBlcmV6bWFAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4gICAgID4+Pj4+IEhpIENocmlzdGlhbi4KPiAgICAgPj4+Pj4KPiAgICAg
Pj4+Pj4gQ291bGQgeW91IHRyeSB0aGlzIHBhdGNoIG9uIHRvcCBvZiAoIjM4Y2VkMDIwODQ5MSB2
aG9zdDogdXNlIGJhdGNoZWQgdmVyc2lvbiBieSBkZWZhdWx0Iik/Cj4gICAgID4+Pj4+Cj4gICAg
ID4+Pj4+IEl0IHdpbGwgbm90IHNvbHZlIHlvdXIgZmlyc3QgcmFuZG9tIGNyYXNoIGJ1dCBpdCBz
aG91bGQgaGVscCB3aXRoIHRoZSBsb3N0IG9mIG5ldHdvcmsgY29ubmVjdGl2aXR5Lgo+ICAgICA+
Pj4+Pgo+ICAgICA+Pj4+PiBQbGVhc2UgbGV0IG1lIGtub3cgaG93IGRvZXMgaXQgZ29lcy4KPiAg
ICAgPj4+Pgo+ICAgICA+Pj4+Cj4gICAgID4+Pj4gMzhjZWQwMjA4NDkxICsgdGhpcyBzZWVtIHRv
IGJlIG9rLgo+ICAgICA+Pj4+Cj4gICAgID4+Pj4gTm90IHN1cmUgaWYgeW91IGNhbiBtYWtlIG91
dCBhbnl0aGluZyBvZiB0aGlzIChhbmQgdGhlIHByZXZpb3VzIGdpdCBiaXNlY3QgbG9nKQo+ICAg
ICA+Pj4KPiAgICAgPj4+IFllcyBpdCBkb2VzIC0gdGhhdCB0aGlzIGlzIGp1c3QgYmFkIHNwbGl0
LXVwIG9mIHBhdGNoZXMsIGFuZCB0aGVyZSdzCj4gICAgID4+PiBzdGlsbCBhIHJlYWwgYnVnIHRo
YXQgY2F1c2VkIHdvcnNlIGNyYXNoZXMgOikKPiAgICAgPj4+Cj4gICAgID4+PiBTbyBJIGp1c3Qg
cHVzaGVkIGJhdGNoLXY0Lgo+ICAgICA+Pj4gSSBleHBlY3QgdGhhdCB3aWxsIGZhaWwsIGFuZCBi
aXNlY3QgdG8gZ2l2ZSB1cwo+ICAgICA+Pj7CoCDCoCDCoHZob3N0OiBiYXRjaGluZyBmZXRjaGVz
Cj4gICAgID4+PiBDYW4geW91IHRyeSB0aGF0IHBsZWFzZT8KPiAgICAgPj4+Cj4gICAgID4+Cj4g
ICAgID4+IHllcy4KPiAgICAgPj4KPiAgICAgPj4gZWNjYjg1MmYxZmU2YmVkZTYzMGUyZTRmMWEx
MjFhODFlMzQzNTRhYiBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdAo+ICAgICA+PiBjb21taXQgZWNj
Yjg1MmYxZmU2YmVkZTYzMGUyZTRmMWExMjFhODFlMzQzNTRhYgo+ICAgICA+PiBBdXRob3I6IE1p
Y2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20gPG1haWx0bzptc3RAcmVkaGF0LmNvbT4+
Cj4gICAgID4+IERhdGU6wqAgwqBNb24gT2N0IDcgMDY6MTE6MTggMjAxOSAtMDQwMAo+ICAgICA+
Pgo+ICAgICA+PsKgIMKgIMKgdmhvc3Q6IGJhdGNoaW5nIGZldGNoZXMKPiAgICAgPj7CoCDCoCDC
oAo+ICAgICA+PsKgIMKgIMKgV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIG5ldyBhbmQgb2xkIGNv
ZGUgcGVyZm9ybSBpZGVudGljYWxseS4KPiAgICAgPj7CoCDCoCDCoAo+ICAgICA+PsKgIMKgIMKg
TG90cyBvZiBleHRyYSBvcHRpbWl6YXRpb25zIGFyZSBub3cgcG9zc2libGUsIGUuZy4KPiAgICAg
Pj7CoCDCoCDCoHdlIGNhbiBmZXRjaCBtdWx0aXBsZSBoZWFkcyB3aXRoIGNvcHlfZnJvbS90b191
c2VyIG5vdy4KPiAgICAgPj7CoCDCoCDCoFdlIGNhbiBnZXQgcmlkIG9mIG1haW50YWluaW5nIHRo
ZSBsb2cgYXJyYXkuwqAgRXRjIGV0Yy4KPiAgICAgPj7CoCDCoCDCoAo+ICAgICA+PsKgIMKgIMKg
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbSA8bWFpbHRv
Om1zdEByZWRoYXQuY29tPj4KPiAgICAgPj4KPiAgICAgPj7CoCBkcml2ZXJzL3Zob3N0L3Rlc3Qu
Y8KgIHzCoCAyICstCj4gICAgID4+wqAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgMzkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gICAgID4+wqAgZHJpdmVycy92aG9z
dC92aG9zdC5oIHzCoCA0ICsrKy0KPiAgICAgPj7CoCAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gICAgID4+Cj4gICAgID4KPiAgICAgPgo+ICAgICA+
IEFuZCB0aGUgc3ltcHRvbSBpcyBzdGlsbCB0aGUgc2FtZSAtIHJhbmRvbSBjcmFzaGVzCj4gICAg
ID4gYWZ0ZXIgYSBiaXQgb2YgdHJhZmZpYywgcmlnaHQ/Cj4gCj4gICAgIHJhbmRvbSBndWVzdCBj
cmFzaGVzIGFmdGVyIGEgcmVib290IG9mIHRoZSBndWVzdHMuIEFzIGlmIHZob3N0IHdvdWxkIHN0
aWxsCj4gICAgIHdyaXRlIGludG8gbm93IHN0YWxlIGJ1ZmZlcnMuCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5n
IGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9s
aXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

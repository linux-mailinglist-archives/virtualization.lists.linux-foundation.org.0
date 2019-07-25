Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA4E742A1
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 02:44:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A7D6516D3;
	Thu, 25 Jul 2019 00:44:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 42F0B16D3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 00:44:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A01DBFE
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 00:44:02 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6P0dlXf171093; Thu, 25 Jul 2019 00:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : to : cc :
	references : from : message-id : date : mime-version : in-reply-to :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=gv2SPbpkF9xScJE1PHpWHpgE3ifu6hFMD2cmVIyD7TY=;
	b=muZVds6swMHMAuFbMxKchNkOUd8CqTrPV0KBCMC49yrWg/LxnLuU6ow/RmgyiMUnnjmy
	MAiRa6Zm+jzf7B99ZPeMXmyGgQxIYQlCeWqFQqyGoNTjbspAoTiqbjfg4/VmNuRd7Vm5
	HrFVwz2k57PMYa/HPZcBBc0f5omPk+LrAWZPjNDUaWWol7Y67+yRcy8wbGU1Wbct1RLH
	zVzTyoIxGQlKet79OucxPmXfLkDZ0FkQP1v/RZBYzmhhy8PDfe/AB0YbSVtLklYjMvP9
	lz6P71WYbBjNCITeo6xlPXLd7l7LVGerjJLbDawimLUiySB/y4c3YF5VO7XLIrxNTkjP
	MA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 2tx61c0gjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 00:41:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x6P0beDT189084; Thu, 25 Jul 2019 00:41:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 2tx60yhed4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2019 00:41:24 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6P0fGBA002510;
	Thu, 25 Jul 2019 00:41:16 GMT
Received: from [192.168.1.14] (/180.165.87.209)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 24 Jul 2019 17:41:15 -0700
Subject: Re: [PATCH 00/12] block/bio, fs: convert put_page() to
	put_user_page*()
To: john.hubbard@gmail.com, Andrew Morton <akpm@linux-foundation.org>
References: <20190724042518.14363-1-jhubbard@nvidia.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <8621066c-e242-c449-eb04-4f2ce6867140@oracle.com>
Date: Thu, 25 Jul 2019 08:41:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190724042518.14363-1-jhubbard@nvidia.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9328
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1907250003
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9328
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1907250003
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-cifs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	v9fs-developer@lists.sourceforge.net,
	Eric Van Hensbergen <ericvh@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	"David S . Miller" <davem@davemloft.net>, linux-fsdevel@vger.kernel.org,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gNy8yNC8xOSAxMjoyNSBQTSwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPiBGcm9t
OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gCj4gSGksCj4gCj4gVGhpcyBp
cyBtb3N0bHkgSmVyb21lJ3Mgd29yaywgY29udmVydGluZyB0aGUgYmxvY2svYmlvIGFuZCByZWxh
dGVkIGFyZWFzCj4gdG8gY2FsbCBwdXRfdXNlcl9wYWdlKigpIGluc3RlYWQgb2YgcHV0X3BhZ2Uo
KS4gQmVjYXVzZSBJJ3ZlIGNoYW5nZWQKPiBKZXJvbWUncyBwYXRjaGVzLCBpbiBzb21lIGNhc2Vz
IHNpZ25pZmljYW50bHksIEknZCBsaWtlIHRvIGdldCBoaXMKPiBmZWVkYmFjayBiZWZvcmUgd2Ug
YWN0dWFsbHkgbGVhdmUgaGltIGxpc3RlZCBhcyB0aGUgYXV0aG9yIChoZSBtaWdodAo+IHdhbnQg
dG8gZGlzb3duIHNvbWUgb3IgYWxsIG9mIHRoZXNlKS4KPiAKCkNvdWxkIHlvdSBhZGQgc29tZSBi
YWNrZ3JvdW5kIHRvIHRoZSBjb21taXQgbG9nIGZvciBwZW9wbGUgZG9uJ3QgaGF2ZSB0aGUgY29u
dGV4dC4uCldoeSB0aGlzIGNvbnZlcnRpbmc/IFdoYXQncyB0aGUgbWFpbiBkaWZmZXJlbmNlcz8K
ClJlZ2FyZHMsIC1Cb2IKCj4gSSBhZGRlZCBhIG5ldyBwYXRjaCwgaW4gb3JkZXIgdG8gbWFrZSB0
aGlzIHdvcmsgd2l0aCBDaHJpc3RvcGggSGVsbHdpZydzCj4gcmVjZW50IG92ZXJoYXVsIHRvIGJp
b19yZWxlYXNlX3BhZ2VzKCk6ICJibG9jazogYmlvX3JlbGVhc2VfcGFnZXM6IHVzZQo+IGZsYWdz
IGFyZyBpbnN0ZWFkIG9mIGJvb2wiLgo+IAo+IEkndmUgc3RhcnRlZCB0aGUgc2VyaWVzIHdpdGgg
YSBwYXRjaCB0aGF0IEkndmUgcG9zdGVkIGluIGFub3RoZXIKPiBzZXJpZXMgKCJtbS9ndXA6IGFk
ZCBtYWtlX2RpcnR5IGFyZyB0byBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkiWzFdKSwKPiBi
ZWNhdXNlIEknbSBub3Qgc3VyZSB3aGljaCBvZiB0aGVzZSB3aWxsIGdvIGluIGZpcnN0LCBhbmQg
dGhpcyBhbGxvd3MgZWFjaAo+IHRvIHN0YW5kIGFsb25lLgo+IAo+IFRlc3Rpbmc6IG5vdCBtdWNo
IGJleW9uZCBidWlsZCBhbmQgYm9vdCB0ZXN0aW5nIGhhcyBiZWVuIGRvbmUgeWV0LiBBbmQKPiBJ
J20gbm90IHNldCB1cCB0byBldmVuIGV4ZXJjaXNlIGFsbCBvZiBpdCAoZXNwZWNpYWxseSB0aGUg
SUIgcGFydHMpIGF0Cj4gcnVuIHRpbWUuCj4gCj4gQW55d2F5LCBjaGFuZ2VzIGhlcmUgYXJlOgo+
IAo+ICogU3RvcmUsIGluIHRoZSBpb3ZfaXRlciwgYSAiY2FtZSBmcm9tIGd1cCAoZ2V0X3VzZXJf
cGFnZXMpIiBwYXJhbWV0ZXIuCj4gICBUaGVuLCB1c2UgdGhlIG5ldyBpb3ZfaXRlcl9nZXRfcGFn
ZXNfdXNlX2d1cCgpIHRvIHJldHJpZXZlIGl0IHdoZW4KPiAgIGl0IGlzIHRpbWUgdG8gcmVsZWFz
ZSB0aGUgcGFnZXMuIFRoYXQgYWxsb3dzIGNob29zaW5nIGJldHdlZW4gcHV0X3BhZ2UoKQo+ICAg
YW5kIHB1dF91c2VyX3BhZ2UqKCkuCj4gCj4gKiBQYXNzIGluIG9uZSBtb3JlIHBpZWNlIG9mIGlu
Zm9ybWF0aW9uIHRvIGJpb19yZWxlYXNlX3BhZ2VzOiBhICJmcm9tX2d1cCIKPiAgIHBhcmFtZXRl
ci4gU2ltaWxhciB1c2UgYXMgYWJvdmUuCj4gCj4gKiBDaGFuZ2UgdGhlIGJsb2NrIGxheWVyLCBh
bmQgc2V2ZXJhbCBmaWxlIHN5c3RlbXMsIHRvIHVzZQo+ICAgcHV0X3VzZXJfcGFnZSooKS4KPiAK
PiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNB
X19sb3JlLmtlcm5lbC5vcmdfcl8yMDE5MDcyNDAxMjYwNi4yNTg0NC0yRDItMkRqaHViYmFyZC00
MG52aWRpYS5jb20mZD1Ed0lEYVEmYz1Sb1AxWXVtQ1hDZ2FXSHZsWllSOFBaaDhCdjdxSXJNVUI2
NWVhcElfSm5FJnI9MWt0VDBVMllTX0k4Wnoyby1NUzFZY0NBeldaNmhGR3R5VGd2Vk1HTTdnSSZt
PUZwRmh2MnJqYktDQVlHbU82SHk4V0pBb3R0cjFRel9tREtETE9iUTQwRlUmcz1xLV9tWDNkYUVy
MjJXYmRaTUVsY19aYkQ4TDlvR0xEN1UweExleUo2NjFZJmU9IAo+ICAgICBBbmQgcGxlYXNlIG5v
dGUgdGhlIGNvcnJlY3Rpb24gZW1haWwgdGhhdCBJIHBvc3RlZCBhcyBhIGZvbGxvdy11cCwKPiAg
ICAgaWYgeW91J3JlIGxvb2tpbmcgY2xvc2VseSBhdCB0aGF0IHBhdGNoLiA6KSBUaGUgZml4ZWQg
dmVyc2lvbiBpcwo+ICAgICBpbmNsdWRlZCBoZXJlLgo+IAo+IEpvaG4gSHViYmFyZCAoMyk6Cj4g
ICBtbS9ndXA6IGFkZCBtYWtlX2RpcnR5IGFyZyB0byBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
KCkKPiAgIGJsb2NrOiBiaW9fcmVsZWFzZV9wYWdlczogdXNlIGZsYWdzIGFyZyBpbnN0ZWFkIG9m
IGJvb2wKPiAgIGZzL2NlcGg6IGZpeCBhIGJ1aWxkIHdhcm5pbmc6IHJldHVybmluZyBhIHZhbHVl
IGZyb20gdm9pZCBmdW5jdGlvbgo+IAo+IErDqXLDtG1lIEdsaXNzZSAoOSk6Cj4gICBpb3ZfaXRl
cjogYWRkIGhlbHBlciB0byB0ZXN0IGlmIGFuIGl0ZXIgd291bGQgdXNlIEdVUCB2Mgo+ICAgYmxv
Y2s6IGJpb19yZWxlYXNlX3BhZ2VzOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFn
ZSooKQo+ICAgYmxvY2tfZGV2OiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSoo
KQo+ICAgZnMvbmZzOiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQo+ICAg
dmhvc3Qtc2NzaTogY29udmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKPiAgIGZz
L2NpZnM6IGNvbnZlcnQgcHV0X3BhZ2UoKSB0byBwdXRfdXNlcl9wYWdlKigpCj4gICBmcy9mdXNl
OiBjb252ZXJ0IHB1dF9wYWdlKCkgdG8gcHV0X3VzZXJfcGFnZSooKQo+ICAgZnMvY2VwaDogY29u
dmVydCBwdXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKPiAgIDlwL25ldDogY29udmVydCBw
dXRfcGFnZSgpIHRvIHB1dF91c2VyX3BhZ2UqKCkKPiAKPiAgYmxvY2svYmlvLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDgxICsrKysrKysrKysrKy0tLQo+ICBkcml2ZXJzL2lu
ZmluaWJhbmQvY29yZS91bWVtLmMgICAgICAgICAgICAgfCAgIDUgKy0KPiAgZHJpdmVycy9pbmZp
bmliYW5kL2h3L2hmaTEvdXNlcl9wYWdlcy5jICAgIHwgICA1ICstCj4gIGRyaXZlcnMvaW5maW5p
YmFuZC9ody9xaWIvcWliX3VzZXJfcGFnZXMuYyB8ICAgNSArLQo+ICBkcml2ZXJzL2luZmluaWJh
bmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jICAgfCAgIDUgKy0KPiAgZHJpdmVycy9pbmZpbmliYW5k
L3N3L3Npdy9zaXdfbWVtLmMgICAgICAgIHwgICA4ICstCj4gIGRyaXZlcnMvdmhvc3Qvc2NzaS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKy0KPiAgZnMvYmxvY2tfZGV2LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIyICsrKy0KPiAgZnMvY2VwaC9kZWJ1Z2ZzLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIGZzL2NlcGgvZmlsZS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA2MiArKysrKysrKy0tLQo+ICBmcy9jaWZzL2NpZnNnbG9i
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+ICBmcy9jaWZzL2ZpbGUuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjIgKysrLQo+ICBmcy9jaWZzL21pc2MuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTkgKysrLQo+ICBmcy9kaXJlY3QtaW8uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgZnMvZnVzZS9kZXYuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIyICsrKy0KPiAgZnMvZnVzZS9maWxlLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUzICsrKysrKystLS0KPiAgZnMvbmZzL2RpcmVjdC5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICstCj4gIGluY2x1ZGUvbGludXgvYmlv
LmggICAgICAgICAgICAgICAgICAgICAgICB8ICAyMiArKystCj4gIGluY2x1ZGUvbGludXgvbW0u
aCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArLQo+ICBpbmNsdWRlL2xpbnV4L3Vpby5o
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKysKPiAgbW0vZ3VwLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMTE1ICsrKysrKysrKy0tLS0tLS0tLS0tLQo+ICBuZXQv
OXAvdHJhbnNfY29tbW9uLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgKystCj4gIG5ldC85
cC90cmFuc19jb21tb24uaCAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICBuZXQvOXAv
dHJhbnNfdmlydGlvLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKysrLQo+ICAyNCBmaWxl
cyBjaGFuZ2VkLCAzNTcgaW5zZXJ0aW9ucygrKSwgMTcwIGRlbGV0aW9ucygtKQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u

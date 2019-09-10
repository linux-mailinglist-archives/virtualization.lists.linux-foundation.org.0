Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C0093AECEB
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 16:25:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EBEAADA4;
	Tue, 10 Sep 2019 14:25:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26639DA2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 14:25:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 852A089C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 14:25:19 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8AENkGG131485; Tue, 10 Sep 2019 14:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to : content-transfer-encoding; s=corp-2019-08-05;
	bh=NHdeAPKmmXhs2gh53Ao/iY+rl0IHNTcE9ceoYzmW3PA=;
	b=eTl3Ht16X9k57STX22Nfse1q1i+nAE2TOCTXC5ruD8NFqq1ebwh84ldhbSzISgmnssuF
	bZIfi3jJldDUhk95HDI8Qd7vioZqIgsTPuYAJmJmPMMhEmrPrpnfOh22bWYYwfdvPQ0W
	5AsHTQqRr9rI0b5wOBdrcZw9xuTuRG07TVcmSqgR2hpE7BFSph8b9enoTeIcAerW5cCB
	MUJWN4L+0WArFfdjI4p38FksHxgCerqViUcWoGVEtdoSJk+8+JEyW4ldrL6DbwPH/ZHW
	sBwq1gi3p5aaqVp2L//aIpV1VGxmbF2cRKlZoK8+zPUvKfHfPO9l4u4RIOqNoXrolw3h
	Jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by aserp2120.oracle.com with ESMTP id 2uw1jy3swg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2019 14:25:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x8AENt39128686; Tue, 10 Sep 2019 14:25:02 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by userp3030.oracle.com with ESMTP id 2uxd6ch563-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2019 14:25:02 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8AEOwoJ025439;
	Tue, 10 Sep 2019 14:24:58 GMT
Received: from char.us.oracle.com (/10.152.32.25)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 10 Sep 2019 07:24:58 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
	id D9F686A010E; Tue, 10 Sep 2019 10:26:42 -0400 (EDT)
Date: Tue, 10 Sep 2019 10:26:42 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>
Subject: Re: [RFC PATCH v6 69/92] kvm: x86: keep the page protected if
	tracked by the introspection tool
Message-ID: <20190910142642.GC5879@char.us.oracle.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-70-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809160047.8319-70-alazar@bitdefender.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1906280000 definitions=main-1909100140
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9376
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
	definitions=main-1909100140
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Zhang@pps.reinject, virtualization@lists.linux-foundation.org,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDc6MDA6MjRQTSArMDMwMCwgQWRhbGJlcnQgTGF6xINy
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggbWlnaHQgYmUgb2Jzb2xldGUgdGhhbmtzIHRvIHNpbmdsZS1z
dGVwcGluZy4KCnNvb28gc2hvdWxkIGl0IGJlIHNraXBwZWQgZnJvbSB0aGlzIGxhcmdlIHBhdGNo
c2V0IHRvIGVhc3kKcmV2aWV3PwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3Ig
PGFsYXphckBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIGFyY2gveDg2L2t2bS94ODYuYyB8IDkg
KysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94
ODYuYwo+IGluZGV4IDJjMDZkZTczYTc4NC4uMDZmNDRjZThlZDA3IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gveDg2L2t2bS94ODYuYwo+ICsrKyBiL2FyY2gveDg2L2t2bS94ODYuYwo+IEBAIC02MzExLDcg
KzYzMTEsOCBAQCBzdGF0aWMgYm9vbCByZWV4ZWN1dGVfaW5zdHJ1Y3Rpb24oc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBndmFfdCBjcjIsCj4gIAkJaW5kaXJlY3Rfc2hhZG93X3BhZ2VzID0gdmNwdS0+
a3ZtLT5hcmNoLmluZGlyZWN0X3NoYWRvd19wYWdlczsKPiAgCQlzcGluX3VubG9jaygmdmNwdS0+
a3ZtLT5tbXVfbG9jayk7Cj4gIAo+IC0JCWlmIChpbmRpcmVjdF9zaGFkb3dfcGFnZXMpCj4gKwkJ
aWYgKGluZGlyZWN0X3NoYWRvd19wYWdlcwo+ICsJCSAgICAmJiAha3ZtaV90cmFja2VkX2dmbih2
Y3B1LCBncGFfdG9fZ2ZuKGdwYSkpKQo+ICAJCQlrdm1fbW11X3VucHJvdGVjdF9wYWdlKHZjcHUt
Pmt2bSwgZ3BhX3RvX2dmbihncGEpKTsKPiAgCj4gIAkJcmV0dXJuIHRydWU7Cj4gQEAgLTYzMjIs
NyArNjMyMyw4IEBAIHN0YXRpYyBib29sIHJlZXhlY3V0ZV9pbnN0cnVjdGlvbihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGd2YV90IGNyMiwKPiAgCSAqIGFuZCBpdCBmYWlsZWQgdHJ5IHRvIHVuc2hh
ZG93IHBhZ2UgYW5kIHJlLWVudGVyIHRoZQo+ICAJICogZ3Vlc3QgdG8gbGV0IENQVSBleGVjdXRl
IHRoZSBpbnN0cnVjdGlvbi4KPiAgCSAqLwo+IC0Ja3ZtX21tdV91bnByb3RlY3RfcGFnZSh2Y3B1
LT5rdm0sIGdwYV90b19nZm4oZ3BhKSk7Cj4gKwlpZiAoIWt2bWlfdHJhY2tlZF9nZm4odmNwdSwg
Z3BhX3RvX2dmbihncGEpKSkKPiArCQlrdm1fbW11X3VucHJvdGVjdF9wYWdlKHZjcHUtPmt2bSwg
Z3BhX3RvX2dmbihncGEpKTsKPiAgCj4gIAkvKgo+ICAJICogSWYgdGhlIGFjY2VzcyBmYXVsdHMg
b24gaXRzIHBhZ2UgdGFibGUsIGl0IGNhbiBub3QKPiBAQCAtNjM3NCw2ICs2Mzc2LDkgQEAgc3Rh
dGljIGJvb2wgcmV0cnlfaW5zdHJ1Y3Rpb24oc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQs
Cj4gIAlpZiAoIXZjcHUtPmFyY2gubW11LT5kaXJlY3RfbWFwKQo+ICAJCWdwYSA9IGt2bV9tbXVf
Z3ZhX3RvX2dwYV93cml0ZSh2Y3B1LCBjcjIsIE5VTEwpOwo+ICAKPiArCWlmIChrdm1pX3RyYWNr
ZWRfZ2ZuKHZjcHUsIGdwYV90b19nZm4oZ3BhKSkpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiAg
CWt2bV9tbXVfdW5wcm90ZWN0X3BhZ2UodmNwdS0+a3ZtLCBncGFfdG9fZ2ZuKGdwYSkpOwo+ICAK
PiAgCXJldHVybiB0cnVlOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=

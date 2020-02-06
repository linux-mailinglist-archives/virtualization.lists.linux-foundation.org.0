Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A783415412B
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 10:30:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5892986133;
	Thu,  6 Feb 2020 09:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IO2LabTv3-Dd; Thu,  6 Feb 2020 09:30:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC0BE860B5;
	Thu,  6 Feb 2020 09:30:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E363C013E;
	Thu,  6 Feb 2020 09:30:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09791C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 05A9785E27
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzgO6up-aVZ0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:30:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 879BB85E0B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 09:30:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 01:30:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,409,1574150400"; 
 d="scan'208,217";a="235907243"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 06 Feb 2020 01:30:18 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 6 Feb 2020 01:30:18 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 6 Feb 2020 01:30:17 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.126]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.98]) with mapi id 14.03.0439.000;
 Thu, 6 Feb 2020 17:30:16 +0800
From: "Wang, Wei W" <wei.w.wang@intel.com>
To: Tyler Sanderson <tysand@google.com>
Subject: RE: Balloon pressuring page cache
Thread-Topic: Balloon pressuring page cache
Thread-Index: AQHV1jovoZrFI2PKjUOgo5GIAcuyoKgA6/YAgACRPICAAUzXAIAAibNg///JVwCABdc9AIAANGSAgAAETACAAGklgIAAo12AgAABfACAAGGxgIABj+gw//+atoCAAIwXoP//fmaAABDM2dAAA64wAAAeT5aw
Date: Thu, 6 Feb 2020 09:30:15 +0000
Message-ID: <286AC319A985734F985F78AFA26841F73E4238E4@shsmsx102.ccr.corp.intel.com>
References: <91270a68-ff48-88b0-219c-69801f0c252f@redhat.com>
 <CAJuQAmoaK0Swytu2Os_SQRfG5_LqiCPaDa9yatatm9MtfncNTQ@mail.gmail.com>
 <75d4594f-0864-5172-a0f8-f97affedb366@redhat.com>
 <286AC319A985734F985F78AFA26841F73E3F8A02@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmqcayaNuG19fKCuux=YVO3+VcN-qrXvobgKMykogeMkzA@mail.gmail.com>
 <20200203080520-mutt-send-email-mst@kernel.org>
 <5ac131de8e3b7fc1fafd05a61feb5f6889aeb917.camel@linux.intel.com>
 <c836a8d1-c5cc-eb8b-84ed-027070b77bf8@redhat.com>
 <539B606A-A0CA-4AA4-B99A-759C874A1EF8@vmware.com>
 <d69eafb4-ad0d-1617-9248-ea4fc776da58@redhat.com>
 <20200204033657-mutt-send-email-mst@kernel.org>
 <ce93331c-0099-dda7-e00f-126bf7826a40@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F0F0@shsmsx102.ccr.corp.intel.com>
 <1eff30a0-a38a-cd45-2fc1-80cfd0bf5f04@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F306@shsmsx102.ccr.corp.intel.com>
 <2b388a78-79cd-f99a-6f87-6446dcb4b819@redhat.com>
 <286AC319A985734F985F78AFA26841F73E41F367@shsmsx102.ccr.corp.intel.com>
 <CAJuQAmrVLV_XDKLoGoRL7Ep8=xj0oio6VE9_3cRhE5s0eZY2sw@mail.gmail.com>
In-Reply-To: <CAJuQAmrVLV_XDKLoGoRL7Ep8=xj0oio6VE9_3cRhE5s0eZY2sw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Nadav Amit <namit@vmware.com>,
 David Rientjes <rientjes@google.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, Michal
 Hocko <mhocko@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5998978535887224519=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============5998978535887224519==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_286AC319A985734F985F78AFA26841F73E4238E4shsmsx102ccrcor_"

--_000_286AC319A985734F985F78AFA26841F73E4238E4shsmsx102ccrcor_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SXNuJ3QgdGhlIGhpbnQgb25seSB1c2VmdWwgZHVyaW5nIHRoZSBmaXJzdCByb3VuZD8NCkFmdGVy
IHRoZSBmaXJzdCByb3VuZCBpZiBhIHBhZ2UgYmVjb21lcyBmcmVlIHRoZW4gd2UgbmVlZCB0byB1
cGRhdGUgdGhlIGNvcHkgYXQgdGhlIG1pZ3JhdGlvbiBkZXN0aW5hdGlvbiwgc28gZnJlZWluZyBh
IHBhZ2UgdGhhdCBwcmV2aW91c2x5IGhhZCBjb250ZW50cyBzaG91bGQgbWFyayBpdCBkaXJ0eS4N
Cg0KDQpOb3BlLiBJIHRoaW5rIGFzIGxvbmcgYXMgaXQgaXMgYSBmcmVlIHBhZ2UgKG5vIG1hdHRl
ciAxc3Qgb3IgMm5kIHJvdW5kKSwgd2UgZG9u4oCZdCBuZWVkIHRvIHNlbmQgaXQuDQoNCkJlc3Qs
DQpXZWkNCg==

--_000_286AC319A985734F985F78AFA26841F73E4238E4shsmsx102ccrcor_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
U2ltU3VuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KQGZvbnQtZmFjZQ0KCXtm
b250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMgMiA0
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1IDUg
MiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJcQFNpbVN1biI7DQoJ
cGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0K
cC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGNtOw0K
CW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5
OlNpbVN1bjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0
eTo5OTsNCgljb2xvcjpibHVlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNp
dGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsN
Cgljb2xvcjpwdXJwbGU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpwLm1zb25vcm1h
bDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1uYW1lOm1zb25v
cm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6MGNtOw0KCW1z
by1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBjbTsNCglmb250LXNpemU6
MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OlNpbVN1bjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0KCXttc28t
c3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1z
ZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10
eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGli
cmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIu
MHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIuMHB0IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2LldvcmRTZWN0
aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5
XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4N
CjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlv
dXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286
c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJaSC1D
TiIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEi
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiPklzbid0IHRoZSBoaW50
IG9ubHkgdXNlZnVsIGR1cmluZyB0aGUgPGk+DQpmaXJzdDwvaT4gcm91bmQ/PG86cD48L286cD48
L3NwYW4+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVT
Ij5BZnRlciB0aGUgZmlyc3Qgcm91bmQgaWYgYSBwYWdlIGJlY29tZXMgZnJlZSB0aGVuIHdlIG5l
ZWQgdG8gdXBkYXRlIHRoZSBjb3B5IGF0IHRoZSBtaWdyYXRpb24gZGVzdGluYXRpb24sIHNvIGZy
ZWVpbmcgYSBwYWdlIHRoYXQgcHJldmlvdXNseSBoYWQgY29udGVudHMgc2hvdWxkIG1hcmsgaXQg
ZGlydHkuPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQt
ZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+PG86cD4mbmJzcDs8L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxl
PSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1z
ZXJpZiI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gbGFuZz0iRU4tVVMiIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZx
dW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZiI+Tm9wZS4gSSB0aGluayBhcyBsb25nIGFzIGl0
IGlzIGEgZnJlZSBwYWdlIChubyBtYXR0ZXIgMTxzdXA+c3Q8L3N1cD4gb3IgMjxzdXA+bmQ8L3N1
cD4gcm91bmQpLCB3ZSBkb27igJl0IG5lZWQgdG8gc2VuZCBpdC48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBsYW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQt
c2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBs
YW5nPSJFTi1VUyIgc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2Fs
aWJyaSZxdW90OyxzYW5zLXNlcmlmIj5CZXN0LDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIGxhbmc9IkVOLVVTIiBzdHlsZT0iZm9udC1zaXplOjEwLjVw
dDtmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWYiPldlaTxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_286AC319A985734F985F78AFA26841F73E4238E4shsmsx102ccrcor_--

--===============5998978535887224519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5998978535887224519==--
